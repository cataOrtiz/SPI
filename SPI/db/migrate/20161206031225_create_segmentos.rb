class CreateSegmentos < ActiveRecord::Migration[5.0]
  def change
    create_table :segmentos do |t|
      t.integer :id_segmento
      t.string :tipo_segmento

      t.timestamps
    end
    add_index :segmentos, :id_segmento, unique: true
  end
end
