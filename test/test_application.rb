require_relative "test_helper"
require "pry"
class TestApp < Sliar::Application
end

class SliarAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"

    assert last_response.ok?
    body = last_response.body
    content_type = last_response.headers["Content-Type"]
    assert body["Hello"]
    assert content_type["text/html"]
  end
end
