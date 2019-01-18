class Project < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :roles, class_name: "ProjectRole"

    belongs_to :workflow

    validates :name, uniqueness: {case_sensitive: false}
end
