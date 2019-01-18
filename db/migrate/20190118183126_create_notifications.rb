class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
