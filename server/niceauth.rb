class NiceAuth # < Sinatra::Base
  # config.middleware.use "NiceAuth" # Rails

  def initialize(app)
    @app = app
  end

  def call(env)
    if ! authenticate(env)
      return [200, {"Content-Type" => "text/html"}, 'Chrome only']
    end
    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end

  def authenticate(env)
    env['HTTP_USER_AGENT'].match /Chrome/i
  end

end
