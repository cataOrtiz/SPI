class Contrato < ApplicationRecord
	has_many :lineas
before_create :set_id_contrato
def set_id_contrato
	last_id_contrato = Contrato.maximum(:id_contrato)
	self.id_contrato = last_id_contrato.to_i + 1
end

end
