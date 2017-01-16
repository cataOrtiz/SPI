class CreateAtributosacumulados < ActiveRecord::Migration[5.0]
  def change
    create_table :atributosacumulados do |t|
      t.integer :id_atr_acum
      t.integer :segmento
      t.integer :pregunta
      t.float :valor
      t.integer :version
      t.date :fecha

      t.timestamps
    end
    add_index :atributosacumulados, :id_atr_acum, unique: true
  end
end
