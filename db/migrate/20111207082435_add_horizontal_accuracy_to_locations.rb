class AddHorizontalAccuracyToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :horizontal_accuracy, :float
  end
end
