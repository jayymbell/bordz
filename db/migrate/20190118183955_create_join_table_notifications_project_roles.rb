class CreateJoinTableNotificationsProjectRoles < ActiveRecord::Migration[5.1]
  def change
    create_join_table :notifications, :project_roles do |t|
      t.index [:project_role_id, :notification_id], name: 'notifications_project_roles_index'
    end
  end
end
