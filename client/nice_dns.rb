# NiceHost DNS client

DEBUG = true

require 'rubygems'
require 'openssl'
require 'base64'
require 'digest/sha1'
require 'json'
require 'uri'
require 'net/http'
require 'net/https'
require 'time'
require 'uri'

require 'nice_dns/request'
require 'nice_dns/errors'
require 'nice_dns/base'
require 'nice_dns/domain'
require 'nice_dns/record'

module Client
  VERSION = '1.0.0'
  
  class << self
    attr_accessor :username
    attr_accessor :apitoken
    attr_accessor :site
  end
  
end

Client.site = "http://localhost:4567"
Client.username = "test_user"
Client.apitoken = "foobar"
