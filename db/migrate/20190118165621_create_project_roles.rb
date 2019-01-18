class CreateProjectRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :project_roles do |t|
      t.references :project
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
