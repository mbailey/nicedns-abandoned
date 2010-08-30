module Client
  class Request
    
    attr_reader :path, :method
    attr_accessor :data
    
    def initialize(path, method = :get)
      @path = path
      @method = method
      @nws_secret_key = 'foobar'
    end
    
    def success?
      @success || false
    end
    
    def output
      @output || nil
    end

    def encode_base64(data)
      return nil if not data
      ::Base64.encode64(data).gsub("\n","")
    end

    def rest_desc(method, uri, headers)
      "#{method}\n" +
      "#{headers['Content-MD5']}\n" +
      "#{headers['Content-Type']}\n" +
      "#{headers['Date']}\n"+
      "#{uri}"
    end

    def sign(request_description)
      digest_generator = ::OpenSSL::Digest::Digest.new('sha1')
      digest = ::OpenSSL::HMAC.digest(digest_generator,
                                    @nws_secret_key,
                                    request_description)
      encode_base64(digest)
    end

    def dump_request(method, uri, headers, data=nil)
      headers_str = headers.collect{|k,v| "  #{k}: #{v}"}.join("\n")
      <<-EOF

REQUEST
=======
Method : #{method}
URI    : #{uri}
Headers: 
#{headers_str}
Body:
#{data}

EOF
    end

    def dump_response(response)
      headers_str = response_headers(response).collect{|k,v| "  #{k}: #{v}"}.join("\n")
      <<-EOF

RESPONSE
========
Status : #{response.response.code} #{response.response.code_type.to_s}
Headers: 
#{headers_str}
Body:
#{response.body}

EOF
    end

    def response_headers(response)
      headers = {}
      response.each_header{|k,v| headers[k] = v}
      headers
    end

    # def sign_rest_description(
    
    ## Make a request to the Client API using net/http. Data passed can be a hash or a string
    ## Hashes will be converted to JSON before being sent to the remote service.
    def make
      uri = URI.parse([Client.site, @path].join('/'))

      data = self.data.to_json if self.data.is_a?(Hash) && self.data.respond_to?(:to_json)
      headers = {}
      # http_request.basic_auth(Client.username, Client.apitoken)
      headers['Accept'] = "application/json"
      headers['Content-Type'] = "application/json"
      headers['Date'] = Time.now

      headers['Authorization'] = sign(rest_desc(@method, uri.path, headers))
      puts dump_request(@method, uri.path, headers, data)

      http_request = http_class.new(uri.path)
      headers.each{ |k,v| http_request.add_field(k, v) }
      
      http = Net::HTTP.new(uri.host, uri.port)
      http_result = http.request(http_request, data)
      puts dump_response(http_result)
      @output = http_result.body
      @success = case http_result
      when Net::HTTPSuccess
        true
      when Net::HTTPServiceUnavailable
        raise Client::Errors::ServiceUnavailable
      when Net::HTTPForbidden, Net::HTTPUnauthorized
        raise Client::Errors::AccessDenied, "Access Denied for '#{Client.username}'"
      when Net::HTTPNotFound
        raise Client::Errors::CommunicationError, "Not Found at #{uri.to_s}"
      when Net::HTTPClientError
        false
      else
        raise Client::Errors::CommunicationError, http_result.body
      end
      self
    end
    
    private
    
    def http_class  
      case @method
      when :post    then Net::HTTP::Post
      when :put     then Net::HTTP::Put
      when :delete  then Net::HTTP::Delete
      else
        Net::HTTP::Get
      end
    end
    
  end
end

include Client
