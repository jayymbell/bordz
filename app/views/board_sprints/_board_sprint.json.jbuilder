json.extract! board_sprint, :id, :board_id, :starts_on, :ends_on, :name, :created_at, :updated_at
json.url board_sprint_url(board_sprint, format: :json)
