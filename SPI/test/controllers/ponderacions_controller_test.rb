require 'test_helper'

class PonderacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ponderacion = ponderacions(:one)
  end

  test "should get index" do
    get ponderacions_url
    assert_response :success
  end

  test "should get new" do
    get new_ponderacion_url
    assert_response :success
  end

  test "should create ponderacion" do
    assert_difference('Ponderacion.count') do
      post ponderacions_url, params: { ponderacion: { fecha: @ponderacion.fecha, id_ponderacion: @ponderacion.id_ponderacion, segmento: @ponderacion.segmento, valor: @ponderacion.valor } }
    end

    assert_redirected_to ponderacion_url(Ponderacion.last)
  end

  test "should show ponderacion" do
    get ponderacion_url(@ponderacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_ponderacion_url(@ponderacion)
    assert_response :success
  end

  test "should update ponderacion" do
    patch ponderacion_url(@ponderacion), params: { ponderacion: { fecha: @ponderacion.fecha, id_ponderacion: @ponderacion.id_ponderacion, segmento: @ponderacion.segmento, valor: @ponderacion.valor } }
    assert_redirected_to ponderacion_url(@ponderacion)
  end

  test "should destroy ponderacion" do
    assert_difference('Ponderacion.count', -1) do
      delete ponderacion_url(@ponderacion)
    end

    assert_redirected_to ponderacions_url
  end
end
