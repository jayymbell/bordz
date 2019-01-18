class CreateWorkflowStates < ActiveRecord::Migration[5.1]
  def change
    create_table :workflow_states do |t|
      t.references :workflow, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
