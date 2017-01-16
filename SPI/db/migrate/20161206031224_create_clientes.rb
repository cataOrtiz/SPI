class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.integer :id_cliente
      t.string :rut_cliente
      t.string :mail_cliente

      t.timestamps
    end
    add_index :clientes, :id_cliente, unique: true
  end
end
