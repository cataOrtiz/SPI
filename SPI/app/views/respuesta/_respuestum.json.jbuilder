json.extract! respuestum, :id, :valor_pregunta, :preguntum_id, :encuestum_id, :created_at, :updated_at
json.url respuestum_url(respuestum, format: :json)