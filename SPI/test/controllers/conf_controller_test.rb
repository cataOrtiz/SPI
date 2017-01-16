require 'test_helper'

class ConfControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conf_index_url
    assert_response :success
  end

end
