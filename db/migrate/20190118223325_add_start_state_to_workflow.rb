class AddStartStateToWorkflow < ActiveRecord::Migration[5.1]
  def change
    add_column :workflows, :start_state, :integer
  end
end
