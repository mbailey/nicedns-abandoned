require 'rubygems'
require 'sinatra/base'
require 'json'
require 'logger'
require 'active_record'

require 'models/domain'
require 'models/record'

require 'server/helpers'

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
  helpers Sinatra::ServerHelpers

  set :sessions, false
  enable :logging

  configure do
    LOGGER = Logger.new("sinatra.log") 
  end

  ActiveRecord::Base.establish_connection(
    :adapter => 'mysql',
    :database => 'powerdns_development',
    :host => 'localhost',
    :username => 'root',
    :password => ''
  )
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  before do
    puts lookup_user
    logger.info dump_request
  end
        
  get '/domains' do
    Domain.all.to_json
  end

  post '/domains' do
    data = parse_body
    domain = Domain.new data['domain']
    Domain.all
  end

  get '/domains/:id' do
    Domain.find(params[:id]).to_json
    # TODO return error if not found
  end

  put '/domains/:id' do
    data = parse_body
    logger.info data
    domain = Domain.find params[:id]
    if domain.update_attributes data['domain']
      "updated"
    else
    # TODO return AR errors
      "failed to update domain"
    end 
  end

end

Server.run!

