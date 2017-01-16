class Cliente < ApplicationRecord
	has_many :lineas
before_create :set_id_cliente
def set_id_cliente
	last_id_cliente = Cliente.maximum(:id_cliente)
	self.id_cliente = last_id_cliente.to_i + 1
end
end
