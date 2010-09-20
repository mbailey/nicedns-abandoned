$: << '.'
require 'rubygems'
require 'sinatra/base'
require 'json'
require 'logger'
require 'active_record'

require 'models/user'
require 'models/role'
require 'models/domain'
require 'models/record'
require 'models/record/soa'
require 'models/record/a'

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

  set :raise_errors, false
  set :show_exceptions, false
  disable :run

  set :sessions, false
  set :show_exceptions, false
  enable :logging

  configure do
    LOGGER = Logger.new("sinatra.log") 
  end

  ActiveRecord::Base.establish_connection(
    :adapter => 'mysql',
    :database => 'pdns_dev',
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

  get '/domains/:id' do
    Domain.find(params[:id]).to_json
    # TODO return error if not found
  end

  post '/domains' do
    data = parse_body
    domain = Domain.new data['domain']
    if domain.save
      domain.to_json
    else
      status 422
      domain.errors.to_json
    end
  end

  put '/domains/:id' do
    data = parse_body
    logger.info data
    domain = Domain.find params[:id]
    if domain.update_attributes data['domain']
      "updated"
    else
      status 422
      domain.errors.to_json
    # TODO return AR errors
    end 
  end

  post '/domains/:domain_id/records' do
    data = parse_body
    domain = Domain.find(params[:domain_id])
    if domain
      record_type = (data['record']['type'] || 'a').downcase
      record = domain.send( "#{record_type}_records".to_sym ).new( data[:record] )
      record = domain.records.new data['record']
      if record.save
        record.to_json
      else
        status 422
        record.errors.to_json
      end
    else
      status 422
      ["domain not found"]
    end
    Domain.find(params[:id]).to_json
  end

end
