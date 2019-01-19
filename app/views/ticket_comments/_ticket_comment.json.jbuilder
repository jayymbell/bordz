json.extract! ticket_comment, :id, :comment, :created_by, :ticket_id, :created_at, :updated_at
json.url ticket_comment_url(ticket_comment, format: :json)
