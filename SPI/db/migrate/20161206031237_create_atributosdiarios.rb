class CreateAtributosdiarios < ActiveRecord::Migration[5.0]
  def change
    create_table :atributosdiarios do |t|
      t.integer :id_atr_diario
      t.integer :segmento
      t.integer :pregunta
      t.float :valor
      t.integer :version
      t.date :fecha

      t.timestamps
    end
    add_index :atributosdiarios, :id_atr_diario, unique: true
  end
end
