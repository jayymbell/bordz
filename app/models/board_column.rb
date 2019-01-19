class BoardColumn < ApplicationRecord
  belongs_to :board
  has_and_belongs_to_many :states, :class_name => "WorkflowState"
end
