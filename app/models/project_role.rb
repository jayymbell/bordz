class ProjectRole < ApplicationRecord
    belongs_to :project
    has_and_belongs_to_many :users
    has_and_belongs_to_many :notifications
    validates :project_id, :presence => true
end
