class Segmento < ApplicationRecord
	has_many :lineas
before_create :set_id_segmento
def set_id_segmento
	last_id_segmento = Segmento.maximum(:id_segmento)
	self.id_segmento = last_id_segmento.to_i + 1
end
end
