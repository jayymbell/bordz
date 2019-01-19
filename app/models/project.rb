class Project < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :roles, class_name: "ProjectRole"

    belongs_to :workflow

    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :workflow, presence: true
end
