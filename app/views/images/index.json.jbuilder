json.array!(@images) do |image|
  json.extract! image, :id, :title, :holder_type, :holder_id
  json.url image_url(image, format: :json)
end
