class DropJoinTableTicketsWorkfloStates < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :tickets, :workflow_states 
  end
end
