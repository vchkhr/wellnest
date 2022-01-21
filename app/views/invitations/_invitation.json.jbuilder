json.extract! invitation, :id, :status, :client_id, :coach_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
