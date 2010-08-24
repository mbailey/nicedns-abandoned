require 'rubygems'
require 'sinatra/base'
require 'json'
require 'active_record'

require 'models/domain'
require 'models/record'

# auth_token.rb
# macro.rb
#  macro_step.rb
# record_template.rb
# role.rb
# user_mailer.rb
# user_observer.rb
# user.rb
# zone_template.rb

class Server < Sinatra::Base

  ActiveRecord::Base.establish_connection(
    :adapter => 'mysql',
    :database => 'powerdns_development',
    :host => 'localhost',
    :username => 'root',
    :password => ''
  )
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  set :sessions, false
  enable :logging
        
  get '/domains' do
    jsonize Domain.all
  end

  get '/domains/:id' do
    jsonize Domain.find(params[:id])
    # TODO return error if not found
  end

  post '/domains' do
    data = parse_body
    domain = Domain.build data['domain']
    if domain.save
    
  end

  put '/domains/:id' do
    data = parse_body
    domain = Domain.find params[:id]
    if domain.update_attributes data['domain']
      "updated"
    else
    # TODO return AR errors
      "failed to update domain"
    end 
  end

  helpers do
    def parse_body
      JSON.parse(request.body.read)
    end
  
    def jsonize(data)
      if data.class == Array
        data.collect{ |d| {d.class.to_s.downcase => d} }.to_json
      else
        { data.class.to_s.downcase => data }.to_json
      end
    end
  end

end

Server.run!

