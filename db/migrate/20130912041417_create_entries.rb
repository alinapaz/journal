class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :physical_location
      t.string :place
      t.string :mood
      t.datetime :took_place_at
      t.string :positive_activity

      t.timestamps
    end
  end
end
