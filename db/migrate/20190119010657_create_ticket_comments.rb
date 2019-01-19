class CreateTicketComments < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_comments do |t|
      t.text :comment
      t.integer :created_by
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
