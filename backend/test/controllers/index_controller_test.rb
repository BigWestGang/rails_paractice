require "test_helper"
require "logger"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "status code 200" do
    get '/'
    assert_response 200
  end
  test "response message hello, world" do
    exp = {message: 'Hello, World'}
    get '/'
    json = JSON.parse(response.body, symbolize_names: true)
    assert_equal exp, json
  end
end
