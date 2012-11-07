run lambda {|env| [200, {'Content-Type' => 'text/plain'}, [env['REMOTE_ADDR']]] }
