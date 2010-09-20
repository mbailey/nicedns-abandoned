# This file goes in domain.com/config.ru
$: << '.'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'server'

# log = File.new("sinatra.log", "a+")
# $stdout.reopen(log)
# $stderr.reopen(log)

# Server.run!
# run Sinatra.application
run Server
