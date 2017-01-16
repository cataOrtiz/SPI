require 'test_helper'

class IndicadoresdiariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indicadoresdiario = indicadoresdiarios(:one)
  end

  test "should get index" do
    get indicadoresdiarios_url
    assert_response :success
  end

  test "should get new" do
    get new_indicadoresdiario_url
    assert_response :success
  end

  test "should create indicadoresdiario" do
    assert_difference('Indicadoresdiario.count') do
      post indicadoresdiarios_url, params: { indicadoresdiario: { fecha: @indicadoresdiario.fecha, id_ind_diario: @indicadoresdiario.id_ind_diario, isn: @indicadoresdiario.isn, resolutividad: @indicadoresdiario.resolutividad, resp_1_2: @indicadoresdiario.resp_1_2, resp_4_5: @indicadoresdiario.resp_4_5, segmento: @indicadoresdiario.segmento, version: @indicadoresdiario.version, volumen: @indicadoresdiario.volumen } }
    end

    assert_redirected_to indicadoresdiario_url(Indicadoresdiario.last)
  end

  test "should show indicadoresdiario" do
    get indicadoresdiario_url(@indicadoresdiario)
    assert_response :success
  end

  test "should get edit" do
    get edit_indicadoresdiario_url(@indicadoresdiario)
    assert_response :success
  end

  test "should update indicadoresdiario" do
    patch indicadoresdiario_url(@indicadoresdiario), params: { indicadoresdiario: { fecha: @indicadoresdiario.fecha, id_ind_diario: @indicadoresdiario.id_ind_diario, isn: @indicadoresdiario.isn, resolutividad: @indicadoresdiario.resolutividad, resp_1_2: @indicadoresdiario.resp_1_2, resp_4_5: @indicadoresdiario.resp_4_5, segmento: @indicadoresdiario.segmento, version: @indicadoresdiario.version, volumen: @indicadoresdiario.volumen } }
    assert_redirected_to indicadoresdiario_url(@indicadoresdiario)
  end

  test "should destroy indicadoresdiario" do
    assert_difference('Indicadoresdiario.count', -1) do
      delete indicadoresdiario_url(@indicadoresdiario)
    end

    assert_redirected_to indicadoresdiarios_url
  end
end
