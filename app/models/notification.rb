class Notification < ApplicationRecord
    has_and_belongs_to_many :project_roles
    has_and_belongs_to_many :users
end
