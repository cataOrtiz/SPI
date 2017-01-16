require 'test_helper'

class AtributosacumuladosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atributosacumulado = atributosacumulados(:one)
  end

  test "should get index" do
    get atributosacumulados_url
    assert_response :success
  end

  test "should get new" do
    get new_atributosacumulado_url
    assert_response :success
  end

  test "should create atributosacumulado" do
    assert_difference('Atributosacumulado.count') do
      post atributosacumulados_url, params: { atributosacumulado: { fecha: @atributosacumulado.fecha, id_atr_acum: @atributosacumulado.id_atr_acum, pregunta: @atributosacumulado.pregunta, segmento: @atributosacumulado.segmento, valor: @atributosacumulado.valor, version: @atributosacumulado.version } }
    end

    assert_redirected_to atributosacumulado_url(Atributosacumulado.last)
  end

  test "should show atributosacumulado" do
    get atributosacumulado_url(@atributosacumulado)
    assert_response :success
  end

  test "should get edit" do
    get edit_atributosacumulado_url(@atributosacumulado)
    assert_response :success
  end

  test "should update atributosacumulado" do
    patch atributosacumulado_url(@atributosacumulado), params: { atributosacumulado: { fecha: @atributosacumulado.fecha, id_atr_acum: @atributosacumulado.id_atr_acum, pregunta: @atributosacumulado.pregunta, segmento: @atributosacumulado.segmento, valor: @atributosacumulado.valor, version: @atributosacumulado.version } }
    assert_redirected_to atributosacumulado_url(@atributosacumulado)
  end

  test "should destroy atributosacumulado" do
    assert_difference('Atributosacumulado.count', -1) do
      delete atributosacumulado_url(@atributosacumulado)
    end

    assert_redirected_to atributosacumulados_url
  end
end
