class RenameLongtitudeToLongitudeInLocations < ActiveRecord::Migration[7.1]
  def change
    rename_column :locations, :longtitude, :longitude
  end
end
