require "sliar/version"
require "sliar/array"

module Sliar
  class Application
    def call(env)
      `echo debug > debug.txt`;
      [200, {'Content-Type' => 'text/html'},
       ["Hello from Ruby on Sliar"]]
    end
  end
end
