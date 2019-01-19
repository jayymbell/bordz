class CreateBoardSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :board_sprints do |t|
      t.references :board, foreign_key: true
      t.datetime :starts_on
      t.datetime :ends_on
      t.string :name

      t.timestamps
    end
  end
end
