class Atributosdiario < ApplicationRecord
	before_create :set_id_atr_diario
def set_id_atr_diario
	last_id_atr_diario = Atributosdiario.maximum(:id_atr_diario)
	self.id_atr_diario = last_id_atr_diario.to_i + 1
end
end
