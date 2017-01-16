class CreatePregunta < ActiveRecord::Migration[5.0]
  def change
    create_table :pregunta do |t|
      t.integer :id_pregunta
      t.string :tipo_pregunta

      t.timestamps
    end
    add_index :pregunta, :id_pregunta, unique: true
  end
end
