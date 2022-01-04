json.extract! clients_problem, :id, :client_id, :problem_id, :created_at, :updated_at
json.url clients_problem_url(clients_problem, format: :json)
