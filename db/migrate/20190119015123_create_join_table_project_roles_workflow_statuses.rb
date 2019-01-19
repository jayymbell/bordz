class CreateJoinTableProjectRolesWorkflowStatuses < ActiveRecord::Migration[5.1]
  def change
    create_join_table :project_roles, :workflow_states do |t|
      t.index [:project_role_id, :workflow_state_id], name: 'project_role_workflow_states_index'
    end
  end
end
