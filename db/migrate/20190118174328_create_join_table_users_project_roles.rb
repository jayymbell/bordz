class CreateJoinTableUsersProjectRoles < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :project_roles do |t|
      t.index [:user_id, :project_role_id]
    end
  end
end
