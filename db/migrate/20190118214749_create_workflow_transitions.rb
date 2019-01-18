class CreateWorkflowTransitions < ActiveRecord::Migration[5.1]
  def change
    create_table :workflow_transitions do |t|
      t.references :workflow, foreign_key: true
      t.string :name
      t.text :description
      t.integer :start_state
      t.integer :end_state

      t.timestamps
    end
  end
end
