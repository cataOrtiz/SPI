class CreateContratos < ActiveRecord::Migration[5.0]
  def change
    create_table :contratos do |t|
      t.integer :id_contrato
      t.string :tipo_contrato

      t.timestamps
    end
    add_index :contratos, :id_contrato, unique: true
  end
end
