require 'newrelic_rpm'

class Application
  def remote_ip(env)
    remote_ip = env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR']
    remote_ip.scan(/[\d.]+/).first
  end

  def call(env)
    [ 200, {'Content-Type'=>'text/plain'}, [remote_ip(env)] ]
  end

  include NewRelic::Agent::Instrumentation::Rack
end

run Application.new
