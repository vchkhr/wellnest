json.extract! client, :id, :image, :age, :bio, :user_id, :gender_id, :created_at, :updated_at
json.url client_url(client, format: :json)
