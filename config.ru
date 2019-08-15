require 'newrelic_rpm'

class Application
  def call(env)
    [ 200, {'Content-Type'=>'text/plain'}, [remote_ip(env)] ]
  end

  private

  def remote_ip(env)
    remote_ip = env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR']
    remote_ip.split(/\s*,\s*/).first
  end
end

run Application.new
