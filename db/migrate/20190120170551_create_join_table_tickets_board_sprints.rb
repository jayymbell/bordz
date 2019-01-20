class CreateJoinTableTicketsBoardSprints < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tickets, :board_sprints do |t|
      t.index [:ticket_id, :board_sprint_id], name: 'tickets_board_sprints_index'
    end
  end
end
