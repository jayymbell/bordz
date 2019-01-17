json.extract! ticket, :id, :assigned_to, :reported_by, :subject, :description, :project_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
