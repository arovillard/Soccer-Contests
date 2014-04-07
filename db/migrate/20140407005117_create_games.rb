class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :contest_id
      t.string :team_a_name
      t.string :team_b_name
      t.integer :team_a_result
      t.integer :team_b_result
      t.datetime :game_date
      t.string :group

      t.timestamps
    end
  end
end
