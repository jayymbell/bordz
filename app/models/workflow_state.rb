class WorkflowState < ApplicationRecord
  belongs_to :workflow

  validates :name, :presence => true
end
