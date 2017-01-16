class Atributosacumulado < ApplicationRecord
	before_create :set_id_atr_acum
	def set_id_atr_acum
	last_id_atr_acum = Atributosacumulado.maximum(:id_atr_acum)
	self.id_atr_acum = last_id_atr_acum.to_i + 1
end
end
