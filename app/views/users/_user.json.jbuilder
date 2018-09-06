json.extract! user, :id, :user_name, :email, :hashed_password, :salt, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
