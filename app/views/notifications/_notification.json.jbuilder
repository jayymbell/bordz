json.extract! notification, :id, :name, :description, :created_at, :updated_at
json.url notification_url(notification, format: :json)
