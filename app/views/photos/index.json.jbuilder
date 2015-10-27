json.array!(@photos) do |photo|
  json.extract! photo, :id, :title, :description, :photo_holder_id, :photo_holder_type, :user_id
  json.url photo_url(photo, format: :json)
end
