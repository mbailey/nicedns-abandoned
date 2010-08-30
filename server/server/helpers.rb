require 'sinatra/base'

module Sinatra
  module ServerHelpers

    def logger
      ::Server::LOGGER
    end

    def lookup_user
      sig = request_headers['authorization']
      if sig =~ /^NiceHOST/
        @access_key, @request_sig = sig.sub('NiceHOST','').strip.split(':')
      end
    end

    def request_body
      @request_body ||= request.body.read
    end

    def request_headers
      @request_headers ||= env.inject({}){|acc, (k,v)| acc[$1.downcase] = v if k =~ /^http_(.*)/i; acc}
    end

    def dump_request
      logger.info ''
      logger.info [request.request_method, request.path].join(' ')
      logger.info "Request Auth: \"#{(request_headers['authorization'] || 'not present')}\""
      logger.info request_body if request_body != ''
      logger.info request_headers.inspect
    end

    def dump_response
      logger.info [response.request_method, request.path].join(' ')
      logger.info request_body
    end
    
    def parse_body
      JSON.parse(request_body)
    end
  
    def jsonize(data)
      if data.class == Array
        data.collect{ |d| {d.class.to_s.downcase => d} }.to_json
      else
        { data.class.to_s.downcase => data }.to_json
      end
    end
  end
  helpers ServerHelpers
end
