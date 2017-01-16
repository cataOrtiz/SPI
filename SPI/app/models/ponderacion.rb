class Ponderacion < ApplicationRecord
	before_create :set_id_ponderacion
	def set_id_ponderacion
	last_id_ponderacion = Ponderacion.maximum(:id_ponderacion)
	self.id_ponderacion = last_id_ponderacion.to_i + 1
end
end
