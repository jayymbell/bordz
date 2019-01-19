class CreateJoinTableBoardColumnsWorkflowStates < ActiveRecord::Migration[5.1]
  def change
    create_join_table :board_columns, :workflow_states do |t|
      t.index [:board_column_id, :workflow_state_id], name: 'boards_column_sorkflow_state_index'
    end
  end
end
