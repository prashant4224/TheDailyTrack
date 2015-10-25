json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :author, :price, :featured, :available_on
  json.url product_url(product, format: :json)
end
