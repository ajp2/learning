class Static
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rackk::Request.new(env)
    path = req.path

    if req.path.index("/#{:public}")
      res = Rack::Response.new
      main_folder = File.dirname(File.dirname(__FILE__))
      route_folder = File.join(main_folder, "/public")
      file = File.read(route_folder)
      res.write(file)
    else
      res = app.call(env)
    end
    res
  end
end
