class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player_1
      t.integer :player_1_score, default: 0
      t.integer :player_2
      t.integer :player_2_score, default: 0
      t.datetime :time

      t.timestamps null: false
    end
  end
end
