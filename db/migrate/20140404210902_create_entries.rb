class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :team_a_name
      t.string :team_b_name
      t.integer :team_a_score
      t.integer :team_b_score

      t.timestamps
    end
  end
end
