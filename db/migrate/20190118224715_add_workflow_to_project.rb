class AddWorkflowToProject < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :workflow, foreign_key: true
  end
end
