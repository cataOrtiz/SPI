class CreatePagos < ActiveRecord::Migration[5.0]
  def change
    create_table :pagos do |t|
      t.integer :id_pago
      t.text :canal
      t.text :orden_compra
      t.date :fecha_transaccion
      t.time :hora
      t.integer :cod_retorno
      t.integer :cod_autorizacion
      t.integer :monto
      t.date :fecha_pago
      t.date :fecha_ident_transaccion
      t.integer :tel_movil
      t.integer :tel_fijo
      t.integer :cod_cliente
      t.integer :documento
      t.references :linea, foreign_key: true

      t.timestamps
    end
    add_index :pagos, :id_pago, unique: true
  end
end
