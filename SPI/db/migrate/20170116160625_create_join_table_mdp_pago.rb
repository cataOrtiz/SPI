class CreateJoinTableMdpPago < ActiveRecord::Migration[5.0]
  def change
    create_join_table :mdps, :pagos do |t|
      # t.index [:mdp_id, :pago_id]
      # t.index [:pago_id, :mdp_id]
    end
  end
end
