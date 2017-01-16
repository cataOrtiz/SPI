class CreateIndicadoresacumulados < ActiveRecord::Migration[5.0]
  def change
    create_table :indicadoresacumulados do |t|
      t.integer :id_ind_acumulado
      t.integer :segmento
      t.float :isn
      t.float :resp_1_2
      t.float :resp_4_5
      t.float :resolutividad
      t.integer :version
      t.date :fecha
      t.integer :volumen

      t.timestamps
    end
    add_index :indicadoresacumulados, :id_ind_acumulado, unique: true
  end
end
