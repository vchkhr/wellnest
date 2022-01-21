json.extract! message, :id, :text, :from_client, :client_id, :coach_id, :created_at, :updated_at
json.url message_url(message, format: :json)
