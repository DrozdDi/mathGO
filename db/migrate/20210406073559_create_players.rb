class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, index: true
      t.integer :total_battles, :default => 1
      t.integer :win, :default => 0
      t.integer :loss, :default => 0
      t.boolean :game, :default => FALSE, index: true

    end
  end
end
