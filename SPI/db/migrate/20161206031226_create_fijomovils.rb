class CreateFijomovils < ActiveRecord::Migration[5.0]
  def change
    create_table :fijomovils do |t|
      t.integer :id_fijomovil
      t.string :tipo_fijomovil

      t.timestamps
    end
    add_index :fijomovils, :id_fijomovil, unique: true
  end
end
