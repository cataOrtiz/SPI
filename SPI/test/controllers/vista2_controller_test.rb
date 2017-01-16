require 'test_helper'

class Vista2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vista2_index_url
    assert_response :success
  end

end
