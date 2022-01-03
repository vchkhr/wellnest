json.extract! client, :id, :image_url, :age, :bio, :user_id, :gender_id, :created_at, :updated_at
json.url client_url(client, format: :json)
