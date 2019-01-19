class CreateBoardColumns < ActiveRecord::Migration[5.1]
  def change
    create_table :board_columns do |t|
      t.references :board, foreign_key: true
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
