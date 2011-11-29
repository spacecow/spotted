class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, :precision => 10, :scale => 7
      t.decimal :longitude, :precision => 10, :scale => 7
      t.integer :user_id

      t.timestamps
    end
  end
end
