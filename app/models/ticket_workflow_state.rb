class TicketWorkflowState < ApplicationRecord
  belongs_to :ticket
  belongs_to :workflow_state
  has_one :creator , :class_name => "User", :foreign_key => "id", :primary_key => "created_by"
end
