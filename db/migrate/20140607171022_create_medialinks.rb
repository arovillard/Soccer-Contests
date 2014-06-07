class CreateMedialinks < ActiveRecord::Migration
  def change
    create_table :medialinks do |t|
      t.string :url
      t.string :title
      t.boolean :video
      t.boolean :photo

      t.timestamps
    end
  end
end
