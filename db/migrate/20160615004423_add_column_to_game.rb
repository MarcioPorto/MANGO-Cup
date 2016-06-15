class AddColumnToGame < ActiveRecord::Migration
  def change
  	add_column :games, :player_id, :integer
    add_column :games, :match_id, :integer
  end
end
