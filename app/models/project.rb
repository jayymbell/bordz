class Project < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :roles, class_name: "ProjectRole"

    belongs_to :workflow

    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :workflow, presence: true

    def users
        return User.joins(:project_roles).where("project_roles.project_id = ?", id).uniq
    end
end
