json.extract! workflow_transition, :id, :workflow_id, :name, :description, :start_state, :end_state, :created_at, :updated_at
json.url workflow_transition_url(workflow_transition, format: :json)
