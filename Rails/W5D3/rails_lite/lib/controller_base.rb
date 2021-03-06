require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route_params = {})
    @req = req
    @res = res
    @params = req.params.merge(route_params)
    @already_built_response = false
    @@protect_from_forgery ||= false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    if already_built_response?
      raise "Double render"
    end

    res.status = 302
    res['Location'] = url
    res.finish
    session.store_session(res)
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    if already_built_response?
      raise "Double render"
    end

    res['Content-Type'] = content_type
    res.write(content)
    res.finish
    session.store_session(res)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    main_folder = File.dirname(File.dirname(__FILE__))
    file_path = File.join(main_folder, "views", self.class.name.underscore, template_name.to_s + ".html.erb")
    file_info = File.read(file_path)
    content = ERB.new(file_info).result(binding)
    render_content(content, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    if @@protect_from_forgery
      cookie = @req.cookies["authenticity_token"]
      unless cookie && cookie == params["authenticity_token"]
        raise "Invalid authenticity token"
      end
    else
      @token ||= generate_authenticity_token
      res.set_cookie('authenticity_token', value: @token, path: '/')
      @token
    end
    
    self.send(name)
    render(name) unless already_built_response?
  end
end