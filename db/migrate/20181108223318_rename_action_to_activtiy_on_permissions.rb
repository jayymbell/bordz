class RenameActionToActivtiyOnPermissions < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :permissions, :action, :activity
  end

  def self.down
    rename_column :permissions, :activity, :action
  end
end
