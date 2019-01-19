class CreateTicketWorkflowTransitions < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_workflow_transitions do |t|
      t.references :ticket, foreign_key: true
      t.references :workflow_transition, foreign_key: true
      t.integer :created_by

      t.timestamps
    end
  end
end
