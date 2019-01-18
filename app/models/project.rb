class Project < ApplicationRecord
    has_many :tickets, dependent: :destroy
end
