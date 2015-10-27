json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :checked_out_at, :total_price
  json.url order_url(order, format: :json)
end
