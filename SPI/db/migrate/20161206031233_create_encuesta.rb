class CreateEncuesta < ActiveRecord::Migration[5.0]
  def change
    create_table :encuesta do |t|
      t.integer :id_encuesta
      t.date :fecha_creacion_encuesta
      t.time :hora_envio_encuesta
      t.integer :resuelto_encuesta
      t.integer :version
      t.references :linea, foreign_key: true
      t.references :motivo, foreign_key: true

      t.timestamps
    end
    add_index :encuesta, :id_encuesta, unique: true
  end
end
