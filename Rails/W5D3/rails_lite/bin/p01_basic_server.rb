require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  path = req.env['REQUEST_PATH']
  res.write(path)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)