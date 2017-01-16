require 'test_helper'

class ConfiguracionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get configuraciones_index_url
    assert_response :success
  end

end
