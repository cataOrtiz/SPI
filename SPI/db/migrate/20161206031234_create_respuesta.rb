class CreateRespuesta < ActiveRecord::Migration[5.0]
  def change
    create_table :respuesta do |t|
      t.integer :valor_pregunta
      t.references :preguntum, foreign_key: true
      t.references :encuestum, foreign_key: true

      t.timestamps
    end
  end
end
