class Linea < ApplicationRecord
  belongs_to :cliente
  belongs_to :segmento
  belongs_to :fijomovil
  belongs_to :contrato
  has_many :encuesta
before_create :set_id_linea
def set_id_linea
	last_id_linea = Linea.maximum(:id_linea)
	self.id_linea = last_id_linea.to_i + 1
end
end
