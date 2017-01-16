require 'test_helper'

class EncuestaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encuestum = encuesta(:one)
  end

  test "should get index" do
    get encuesta_url
    assert_response :success
  end

  test "should get new" do
    get new_encuestum_url
    assert_response :success
  end

  test "should create encuestum" do
    assert_difference('Encuestum.count') do
      post encuesta_url, params: { encuestum: { fecha_creacion_encuesta: @encuestum.fecha_creacion_encuesta, hora_envio_encuesta: @encuestum.hora_envio_encuesta, id_encuesta: @encuestum.id_encuesta, linea_id: @encuestum.linea_id, motivo_id: @encuestum.motivo_id, resuelto_encuesta: @encuestum.resuelto_encuesta, version: @encuestum.version } }
    end

    assert_redirected_to encuestum_url(Encuestum.last)
  end

  test "should show encuestum" do
    get encuestum_url(@encuestum)
    assert_response :success
  end

  test "should get edit" do
    get edit_encuestum_url(@encuestum)
    assert_response :success
  end

  test "should update encuestum" do
    patch encuestum_url(@encuestum), params: { encuestum: { fecha_creacion_encuesta: @encuestum.fecha_creacion_encuesta, hora_envio_encuesta: @encuestum.hora_envio_encuesta, id_encuesta: @encuestum.id_encuesta, linea_id: @encuestum.linea_id, motivo_id: @encuestum.motivo_id, resuelto_encuesta: @encuestum.resuelto_encuesta, version: @encuestum.version } }
    assert_redirected_to encuestum_url(@encuestum)
  end

  test "should destroy encuestum" do
    assert_difference('Encuestum.count', -1) do
      delete encuestum_url(@encuestum)
    end

    assert_redirected_to encuesta_url
  end
end
