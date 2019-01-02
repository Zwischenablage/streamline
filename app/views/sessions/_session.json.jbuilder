json.extract! session, :id, :finished_at, :vehicle, :state, :created_at, :updated_at
json.url session_url(session, format: :json)
