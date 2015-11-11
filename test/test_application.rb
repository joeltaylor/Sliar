require_relative "test_helper"
require "pry"

class TestController < Sliar::Controller
  def index
    "Hello!"
  end
end

class TestApp < Sliar::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class SliarAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/example/action"

    assert last_response.ok?
    body = last_response.body
    content_type = last_response.headers["Content-Type"]
    assert body["Hello!"]
    assert content_type["text/html"]
  end
end
