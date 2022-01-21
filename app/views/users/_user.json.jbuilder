json.extract! user, :id, :name, :email, :is_verified, :send_email_notifications, :created_at, :updated_at
json.url user_url(user, format: :json)
