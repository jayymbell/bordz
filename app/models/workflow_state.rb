class WorkflowState < ApplicationRecord
  belongs_to :workflow
  has_many :transitions, :class_name => "WorkflowTransition", :foreign_key => "start_state", :primary_key => "id"
  has_and_belongs_to_many :project_roles

  validates :name, :presence => true
end
