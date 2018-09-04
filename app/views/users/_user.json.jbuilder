json.extract! user, :id, :user_name, :email, :salt, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
