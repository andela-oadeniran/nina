require 'rack'

require "nina/version"
module Nina
  class Application
    def call(env)
      req = Rack::Request.new(env)
      return [500, {}, []] if req.path_info == '/favicon.ico'
      controller, action = get_controller_and_action(req)
      response = controller.new.send(action)
      [200, { "Content-Type" => "text/html"}, [response]]
    end

    def get_controller_and_action(request)
      _, controller, action, others = request.path_info.split('/', 4)
      # assign to IndexController for the '/' path_info
      controller = 'index' if controller == ""
      require "#{controller}_controller.rb"
      controller = Object.const_get("#{controller.capitalize!+ 'Controller'}")
      # use request verb to build an action
      action ||= 'index'
      [controller, action]
    end
  end
end
