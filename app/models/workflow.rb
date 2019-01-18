class Workflow < ApplicationRecord
    has_many :states, :class_name => "WorkflowState"
    has_many :transitions, :class_name => "WorkflowTransition"
    has_many :projects

    has_one :starting_state, :class_name => "WorkflowState", :foreign_key => "id", :primary_key => "start_state"

    validates :name, :presence => true, uniqueness: {case_sensitive: false}
end
