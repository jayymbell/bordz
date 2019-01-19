class CreateJoinTableBoardsProjects < ActiveRecord::Migration[5.1]
  def change
    create_join_table :boards, :projects do |t|
      t.index [:board_id, :project_id], name: 'boards_projects_index'
    end
  end
end
