require 'test_helper'

class AtributosdiariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atributosdiario = atributosdiarios(:one)
  end

  test "should get index" do
    get atributosdiarios_url
    assert_response :success
  end

  test "should get new" do
    get new_atributosdiario_url
    assert_response :success
  end

  test "should create atributosdiario" do
    assert_difference('Atributosdiario.count') do
      post atributosdiarios_url, params: { atributosdiario: { fecha: @atributosdiario.fecha, id_atr_diario: @atributosdiario.id_atr_diario, pregunta: @atributosdiario.pregunta, segmento: @atributosdiario.segmento, valor: @atributosdiario.valor, version: @atributosdiario.version } }
    end

    assert_redirected_to atributosdiario_url(Atributosdiario.last)
  end

  test "should show atributosdiario" do
    get atributosdiario_url(@atributosdiario)
    assert_response :success
  end

  test "should get edit" do
    get edit_atributosdiario_url(@atributosdiario)
    assert_response :success
  end

  test "should update atributosdiario" do
    patch atributosdiario_url(@atributosdiario), params: { atributosdiario: { fecha: @atributosdiario.fecha, id_atr_diario: @atributosdiario.id_atr_diario, pregunta: @atributosdiario.pregunta, segmento: @atributosdiario.segmento, valor: @atributosdiario.valor, version: @atributosdiario.version } }
    assert_redirected_to atributosdiario_url(@atributosdiario)
  end

  test "should destroy atributosdiario" do
    assert_difference('Atributosdiario.count', -1) do
      delete atributosdiario_url(@atributosdiario)
    end

    assert_redirected_to atributosdiarios_url
  end
end
