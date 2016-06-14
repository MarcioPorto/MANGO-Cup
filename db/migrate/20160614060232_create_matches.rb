class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :winner_id
      t.integer :winner_score
      t.integer :loser_id
      t.integer :loser_score
      t.datetime :time

      t.timestamps null: false
    end
  end
end
