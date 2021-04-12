class CreateBattlesPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :battles_players do |t|
      t.integer :player_id
      t.integer :battle_id
    end
  end
end
