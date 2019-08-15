require 'newrelic_rpm'

class Application
  def call(env)
    request = Rack::Request.new(env)
    [200, { 'Content-Type' => 'text/plain' }, [request.ip]]
  end
end

run Application.new
