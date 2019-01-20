class AddIsCompleteToBoardSprint < ActiveRecord::Migration[5.1]
  def change
    add_column :board_sprints, :is_complete, :boolean
  end
end
