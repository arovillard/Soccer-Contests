class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.integer :user_id
      t.integer :entry_id
      t.integer :game_id
      t.integer :raffle_number

      t.timestamps
    end
  end
end
