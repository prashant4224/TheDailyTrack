json.array!(@objectives) do |objective|
  json.extract! objective, :id, :name, :description, :start_date, :end_date, :type, :phase_id
  json.url objective_url(objective, format: :json)
end
