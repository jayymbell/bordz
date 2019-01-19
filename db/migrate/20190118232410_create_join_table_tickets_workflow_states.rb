class CreateJoinTableTicketsWorkflowStates < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tickets, :workflow_states do |t|
      t.index [:ticket_id, :workflow_state_id], name: 'ticket_workflow_states_index'
    end
  end
end
