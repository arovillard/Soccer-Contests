class Addcolumntogame < ActiveRecord::Migration
  def change
    add_column :games, :active, :boolean
  end
end
