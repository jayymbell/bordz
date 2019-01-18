class Project < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :roles, class_name: "ProjectRole"
end
