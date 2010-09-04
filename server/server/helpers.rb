require 'sinatra/base'
require 'base64'
require 'digest/md5'
require 'digest/sha1'
require 'openssl'

class Client;
  def self.username; 'test_user'; end
  def self.apitoken; 'foobar'; end
 end

module Sinatra
  module ServerHelpers

    def token(user)
      'foobar'
    end

    def logger
      ::Server::LOGGER
    end

    def lookup_user
      sig = request_headers['authorization']
      if sig =~ /^NWS/
        @access_key, @request_sig = sig.sub('NWS ','').strip.split(':')
      end
    end

    def request_body
      @request_body ||= request.body.read
    end

    def request_headers
      @request_headers ||= env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}
    end

# Auth stuff
    def encode_base64(data)
      return nil if not data
      ::Base64.encode64(data).gsub("\n","")
    end

    def rest_desc
      "#{env['REQUEST_METHOD']}\n" +
      "#{env['HTTP_CONTENT_MD5']}\n" +
      "#{env['CONTENT_TYPE']}\n" +
      "#{env['HTTP_DATE']}\n"+
      "#{env['REQUEST_URI']}"
    end

    def sign(request_description, user=Client.username, apitoken=Client.apitoken)
      digest_generator = ::OpenSSL::Digest::Digest.new('sha1')
      digest = ::OpenSSL::HMAC.digest(digest_generator,
                                    apitoken,
                                    request_description)
      encode_base64(digest)
    end

    def dump_request
      # logger.info [request.request_method, request.path].join(' ')
      # logger.info "Request Auth: \"#{(request_headers['authorization'] || 'not present')}\""
      # logger.info request_body if request_body != ''
      # logger.info request_headers.inspect

      headers_str = request_headers.collect{|k,v| "  #{k}: #{v}"}.join("\n")
      <<-EOF

REQUEST
=======
Method : #{request.request_method}
URI    : #{request.path}
Headers:
#{headers_str}
Body:
#{request_body}

Request Desc (MD5=#{Digest::MD5.hexdigest(rest_desc)})
------------
#{rest_desc}

#{sign(rest_desc)}

request headers 
---------------
#{ request_headers.collect{|k,v| "#{k}=#{v}" }.join("\n")}

env
---
 #{ env.collect{|k,v| "#{k}=#{v}" }.join("\n")}

EOF
    end

    def dump_response
      logger.info [response.request_method, request.path].join(' ')
      logger.info request_body
    end
    
    def parse_body
      JSON.parse(request_body)
    end
  
  end
  helpers ServerHelpers
end
