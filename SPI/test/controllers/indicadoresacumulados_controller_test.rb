require 'test_helper'

class IndicadoresacumuladosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indicadoresacumulado = indicadoresacumulados(:one)
  end

  test "should get index" do
    get indicadoresacumulados_url
    assert_response :success
  end

  test "should get new" do
    get new_indicadoresacumulado_url
    assert_response :success
  end

  test "should create indicadoresacumulado" do
    assert_difference('Indicadoresacumulado.count') do
      post indicadoresacumulados_url, params: { indicadoresacumulado: { fecha: @indicadoresacumulado.fecha, id_ind_acumulado: @indicadoresacumulado.id_ind_acumulado, isn: @indicadoresacumulado.isn, resolutividad: @indicadoresacumulado.resolutividad, resp_1_2: @indicadoresacumulado.resp_1_2, resp_4_5: @indicadoresacumulado.resp_4_5, segmento: @indicadoresacumulado.segmento, version: @indicadoresacumulado.version, volumen: @indicadoresacumulado.volumen } }
    end

    assert_redirected_to indicadoresacumulado_url(Indicadoresacumulado.last)
  end

  test "should show indicadoresacumulado" do
    get indicadoresacumulado_url(@indicadoresacumulado)
    assert_response :success
  end

  test "should get edit" do
    get edit_indicadoresacumulado_url(@indicadoresacumulado)
    assert_response :success
  end

  test "should update indicadoresacumulado" do
    patch indicadoresacumulado_url(@indicadoresacumulado), params: { indicadoresacumulado: { fecha: @indicadoresacumulado.fecha, id_ind_acumulado: @indicadoresacumulado.id_ind_acumulado, isn: @indicadoresacumulado.isn, resolutividad: @indicadoresacumulado.resolutividad, resp_1_2: @indicadoresacumulado.resp_1_2, resp_4_5: @indicadoresacumulado.resp_4_5, segmento: @indicadoresacumulado.segmento, version: @indicadoresacumulado.version, volumen: @indicadoresacumulado.volumen } }
    assert_redirected_to indicadoresacumulado_url(@indicadoresacumulado)
  end

  test "should destroy indicadoresacumulado" do
    assert_difference('Indicadoresacumulado.count', -1) do
      delete indicadoresacumulado_url(@indicadoresacumulado)
    end

    assert_redirected_to indicadoresacumulados_url
  end
end
