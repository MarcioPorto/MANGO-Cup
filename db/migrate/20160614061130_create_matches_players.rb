class CreateMatchesPlayers < ActiveRecord::Migration
  def change
    create_table :matches_players do |t|
      t.integer :match_id
      t.integer :player_id
    end
  end
end
