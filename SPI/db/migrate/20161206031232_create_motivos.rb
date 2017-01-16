class CreateMotivos < ActiveRecord::Migration[5.0]
  def change
    create_table :motivos do |t|
      t.integer :id_motivo
      t.string :tipo_motivo

      t.timestamps
    end
    add_index :motivos, :id_motivo, unique: true
  end
end
