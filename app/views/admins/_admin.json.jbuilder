json.extract! admin, :id, :name, :password, :token, :created_at, :updated_at
json.url admin_url(admin, format: :json)
