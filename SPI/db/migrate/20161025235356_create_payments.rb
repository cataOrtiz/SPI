class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :canal
      t.string :pago

      t.timestamps
    end
  end
end
