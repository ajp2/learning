require 'json'

class Flash
  attr_reader :now

  def initialize(req)
    flash = req.cookies['_rails_lite_app_flash']
    @now = flash ? JSON.parse(flash) : {}
    @flash = {}
  end

  def [](key)
    @now[key.to_s] || @flash[key.to_s]
  end

  def []=(key, val)
    @flash[key.to_s] = val
  end

  def store_flash(res)
    res.set_cookie("_rails_lite_app_flash", { path: "/", value: @flash.to_json })
  end
end
