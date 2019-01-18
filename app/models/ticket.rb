class Ticket < ApplicationRecord
  belongs_to :project
  has_one :assignee, :class_name => "User", :foreign_key => "id", :primary_key => "assigned_to"
  has_one :reporter, :class_name => "User", :foreign_key => "id", :primary_key => "reported_by"

  validates :reported_by, :project_id, :presence => true
end
