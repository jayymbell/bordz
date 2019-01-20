class AddIsActiveToBoardSprint < ActiveRecord::Migration[5.1]
  def change
    add_column :board_sprints, :is_active, :boolean
  end
end
