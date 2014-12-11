json.array!(@orders) do |order|
  json.extract! order, :id, :address, :state, :city
  json.url order_url(order, format: :json)
end
