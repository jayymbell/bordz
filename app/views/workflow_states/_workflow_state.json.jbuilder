json.extract! workflow_state, :id, :workflow_id, :name, :description, :created_at, :updated_at
json.url workflow_state_url(workflow_state, format: :json)
