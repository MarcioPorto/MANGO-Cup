class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :won, default: 0
      t.integer :lost, default: 0

      t.timestamps null: false
    end
  end
end
