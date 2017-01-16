require 'test_helper'

class PagosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pago = pagos(:one)
  end

  test "should get index" do
    get pagos_url
    assert_response :success
  end

  test "should get new" do
    get new_pago_url
    assert_response :success
  end

  test "should create pago" do
    assert_difference('Pago.count') do
      post pagos_url, params: { pago: { canal: @pago.canal, cod_autorizacion: @pago.cod_autorizacion, cod_cliente: @pago.cod_cliente, cod_retorno: @pago.cod_retorno, documento: @pago.documento, fecha_ident_transaccion: @pago.fecha_ident_transaccion, fecha_pago: @pago.fecha_pago, fecha_transaccion: @pago.fecha_transaccion, hora: @pago.hora, id_pago: @pago.id_pago, linea_id: @pago.linea_id, monto: @pago.monto, orden_compra: @pago.orden_compra, tel_fijo: @pago.tel_fijo, tel_movil: @pago.tel_movil } }
    end

    assert_redirected_to pago_url(Pago.last)
  end

  test "should show pago" do
    get pago_url(@pago)
    assert_response :success
  end

  test "should get edit" do
    get edit_pago_url(@pago)
    assert_response :success
  end

  test "should update pago" do
    patch pago_url(@pago), params: { pago: { canal: @pago.canal, cod_autorizacion: @pago.cod_autorizacion, cod_cliente: @pago.cod_cliente, cod_retorno: @pago.cod_retorno, documento: @pago.documento, fecha_ident_transaccion: @pago.fecha_ident_transaccion, fecha_pago: @pago.fecha_pago, fecha_transaccion: @pago.fecha_transaccion, hora: @pago.hora, id_pago: @pago.id_pago, linea_id: @pago.linea_id, monto: @pago.monto, orden_compra: @pago.orden_compra, tel_fijo: @pago.tel_fijo, tel_movil: @pago.tel_movil } }
    assert_redirected_to pago_url(@pago)
  end

  test "should destroy pago" do
    assert_difference('Pago.count', -1) do
      delete pago_url(@pago)
    end

    assert_redirected_to pagos_url
  end
end
