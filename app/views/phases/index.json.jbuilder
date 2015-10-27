json.array!(@phases) do |phase|
  json.extract! phase, :id, :name, :description, :start_date, :end_date, :plan_id
  json.url phase_url(phase, format: :json)
end
