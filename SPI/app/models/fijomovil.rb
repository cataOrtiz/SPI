class Fijomovil < ApplicationRecord
	has_many :lineas
before_create :set_id_fijomovil
def set_id_fijomovil
	last_id_fijomovil = Fijomovil.maximum(:id_fijomovil)
	self.id_fijomovil = last_id_fijomovil.to_i + 1
end

end
