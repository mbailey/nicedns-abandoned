# NiceHost DNS client

DEBUG = true

require 'rubygems'
require 'json'
require 'uri'
require 'net/http'
require 'time'

require 'client/request'
require 'client/errors'
require 'client/base'
require 'client/domain'
require 'client/record'

module Client
  VERSION = '1.0.0'
  
  class << self
    attr_accessor :username
    attr_accessor :apitoken
    attr_accessor :site
  end
  
end

Client.site = "http://localhost:4567"
