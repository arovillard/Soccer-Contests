class AddColumnToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :contest_id, :integer
  end
end
