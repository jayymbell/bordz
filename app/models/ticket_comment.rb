class TicketComment < ApplicationRecord
  belongs_to :ticket
  has_one :creator, :class_name => "User", :foreign_key => "id", :primary_key => "created_by"
end
