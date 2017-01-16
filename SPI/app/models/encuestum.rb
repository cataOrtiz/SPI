class Encuestum < ApplicationRecord
  belongs_to :linea
  belongs_to :motivo
  has_many :pregunta, through: :respuesta
has_many :respuesta
before_create :set_id_encuesta
def set_id_encuesta
	last_id_encuesta = Encuestum.maximum(:id_encuesta)
	self.id_encuesta = last_id_encuesta.to_i + 1
end

end
