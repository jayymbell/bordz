class WorkflowTransition < ApplicationRecord
  belongs_to :workflow
  has_one :starting_state, :class_name => "WorkflowState", :foreign_key => "id", :primary_key => "start_state"
  has_one :ending_state, :class_name => "WorkflowState", :foreign_key => "id", :primary_key => "end_state"

  validates :name, :presence => true
  validates :workflow, :start_state, :end_state, :presence => true
end
