require 'test_helper'

class FijomovilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fijomovil = fijomovils(:one)
  end

  test "should get index" do
    get fijomovils_url
    assert_response :success
  end

  test "should get new" do
    get new_fijomovil_url
    assert_response :success
  end

  test "should create fijomovil" do
    assert_difference('Fijomovil.count') do
      post fijomovils_url, params: { fijomovil: { id_fijomovil: @fijomovil.id_fijomovil, tipo_fijomovil: @fijomovil.tipo_fijomovil } }
    end

    assert_redirected_to fijomovil_url(Fijomovil.last)
  end

  test "should show fijomovil" do
    get fijomovil_url(@fijomovil)
    assert_response :success
  end

  test "should get edit" do
    get edit_fijomovil_url(@fijomovil)
    assert_response :success
  end

  test "should update fijomovil" do
    patch fijomovil_url(@fijomovil), params: { fijomovil: { id_fijomovil: @fijomovil.id_fijomovil, tipo_fijomovil: @fijomovil.tipo_fijomovil } }
    assert_redirected_to fijomovil_url(@fijomovil)
  end

  test "should destroy fijomovil" do
    assert_difference('Fijomovil.count', -1) do
      delete fijomovil_url(@fijomovil)
    end

    assert_redirected_to fijomovils_url
  end
end
