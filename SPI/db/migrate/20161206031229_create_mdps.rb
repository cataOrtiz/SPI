class CreateMdps < ActiveRecord::Migration[5.0]
  def change
    create_table :mdps do |t|
      t.integer :id_mdp
      t.string :nombre_mdp

      t.timestamps
    end
    add_index :mdps, :id_mdp, unique: true
  end
end
