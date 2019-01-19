class AddWorkflowToTicket < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :workflow, foreign_key: true
  end
end
