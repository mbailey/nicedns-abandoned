# require File.dirname(__FILE__) + '/../server'
require './server'
require 'spec'
require 'spec/interop/test'
require 'rack/test'

set :environment, :test
Test::Unit::TestCase.send :include, Rack::Test::Methods

def app
  Sinatra::Application
end

describe "server" do
  # before(:each) do
  #  Domain.delete_all
  # end

  describe "GET on /domains" do
    
    it "should return a list of domains" do
      get '/domains'
      last_response.should be_ok
      attributes = JSON.parse(last_response.body)
      attributes.class == Array
    end

  end

end

