require 'test_helper'

class GraficosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get graficos_index_url
    assert_response :success
  end

end
