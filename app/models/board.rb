class Board < ApplicationRecord
    has_and_belongs_to_many :projects
    has_many :columns, :class_name => "BoardColumn"
    has_many :sprints, :class_name => "BoardSprint"
end
