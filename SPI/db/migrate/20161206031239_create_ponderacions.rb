class CreatePonderacions < ActiveRecord::Migration[5.0]
  def change
    create_table :ponderacions do |t|
      t.integer :id_ponderacion
      t.integer :segmento
      t.float :valor
      t.date :fecha

      t.timestamps
    end
    add_index :ponderacions, :id_ponderacion, unique: true
  end
end
