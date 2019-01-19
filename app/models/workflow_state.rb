class WorkflowState < ApplicationRecord
  belongs_to :workflow
  has_many :transitions, :class_name => "WorkflowTransition", :foreign_key => "start_state", :primary_key => "id"

  validates :name, :presence => true
end
