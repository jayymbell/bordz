class Ticket < ApplicationRecord
  belongs_to :project
  has_one :assignee, :class_name => "User", :foreign_key => "id", :primary_key => "assigned_to"
  has_one :reporter, :class_name => "User", :foreign_key => "id", :primary_key => "reported_by"

  has_many :states, :class_name => "TicketWorkflowState", foreign_key: "ticket_id"
  has_many :transitions, :class_name => "TicketWorkflowTransitions", foreign_key: "ticket_id"

  validates :reported_by, :project_id, :presence => true

  def state
    return states.order(:created_at).last.workflow_state
  end

end
