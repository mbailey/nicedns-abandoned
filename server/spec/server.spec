# require File.dirname(__FILE__) + '/../server'
require './server'
require 'spec'
require 'spec/interop/test'
require 'rack/test'

# set :environment, :test
# Test::Unit::TestCase.send :include, Rack::Test::Methods

def app
  Server
end

describe "server" do

  include  Rack::Test::Methods
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

  describe "GET on /domains/1" do
    
    it "should return a domain" do
      get '/domains/1'
      last_response.should be_ok
      attributes = JSON.parse(last_response.body)
      attributes.keys.should == ['domain']
      attributes['domain']['name'].should == 'example.com'
    end

  end

  describe "PUT on /domains/1" do
    
    it "should update a domain attribute" do
      date = Time.now.to_s
      put '/domains/1', { :domain => {:notes => date } }.to_json
      last_response.should be_ok
      get '/domains/1'
      attributes = JSON.parse(last_response.body)
      attributes['domain']['notes'].should == date
    end

  end


end

