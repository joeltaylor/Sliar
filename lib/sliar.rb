require "sliar/version"

module Sliar
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'},
       ["Hello from Ruby on Sliar"]]
    end
  end
end
