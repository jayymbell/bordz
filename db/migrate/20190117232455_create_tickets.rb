class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :assigned_to
      t.integer :reported_by
      t.string :subject
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
