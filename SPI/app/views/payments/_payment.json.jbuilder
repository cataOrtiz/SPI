json.extract! payment, :id, :canal, :pago, :created_at, :updated_at
json.url payment_url(payment, format: :json)