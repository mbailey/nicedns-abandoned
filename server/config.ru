# This file goes in domain.com/config.ru
require 'rubygems'
require 'sinatra'
 
set :env,  :production
disable :run

require 'server'

# log = File.new("sinatra.log", "a+")
# $stdout.reopen(log)
# $stderr.reopen(log)

run Sinatra.application
