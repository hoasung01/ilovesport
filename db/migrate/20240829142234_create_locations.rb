class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
