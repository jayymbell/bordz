json.extract! board_column, :id, :board_id, :name, :description, :position, :created_at, :updated_at
json.url board_column_url(board_column, format: :json)
