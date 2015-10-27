json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :description, :start_date, :end_date, :team_id
  json.url plan_url(plan, format: :json)
end
