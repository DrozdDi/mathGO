class CreateBattles < ActiveRecord::Migration[6.1]
  def change
    create_table :battles do |t|

      t.string :has_players, index: true  
      t.integer :lp_points, :default => 100
      t.integer :rp_points, :default => 100
      t.integer :system_answer
      t.integer :user_answer
      t.datetime :was_ready_at
      t.string :status
      t.integer :damage

    end
  end
end
