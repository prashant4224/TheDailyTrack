json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :body, :team_id, :user_id, :status, :objective_id
  json.url ticket_url(ticket, format: :json)
end
