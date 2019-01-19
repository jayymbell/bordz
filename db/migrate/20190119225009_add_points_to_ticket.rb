class AddPointsToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :points, :integer
  end
end
