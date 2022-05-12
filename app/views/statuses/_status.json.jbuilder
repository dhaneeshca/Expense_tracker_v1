# json.extract! status, :id, :status_state, :created_at, :updated_at
json.state status.status_state
json.url status_url(status, format: :json)
