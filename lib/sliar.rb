require "sliar/version"
require "sliar/routing"
require "sliar/utils"
require "sliar/dependencies"
require "pry"

module Sliar
  class Application
    def call(env)
      # Simple cheat around not having a favicon that will need to be
      # fixed later.
      path = env["PATH_INFO"]
      if path == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      elsif path == '/'
        return [200, {'Content-Type' => 'text/html'}, [
          File.read('public/index.html')
        ]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      return [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
