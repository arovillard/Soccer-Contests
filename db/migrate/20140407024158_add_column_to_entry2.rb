class AddColumnToEntry2 < ActiveRecord::Migration
  def change
    add_column :entries, :game_id, :integer
  end
end
