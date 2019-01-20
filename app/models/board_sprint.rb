class BoardSprint < ApplicationRecord
  belongs_to :board
  has_and_belongs_to_many :tickets

  validates :name, :presence => true, uniqueness: {case_sensitive: false, scope: [:board_id]}
  validates :starts_on, :ends_on, :presence => true

end
