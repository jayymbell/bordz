class CreateJoinTableUsersNotifications < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :notifications do |t|
      t.index [:users_id, :notifications_id], name: 'users_notifications_index'
    end
  end
end
