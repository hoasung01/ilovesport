class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :mobile_number
      t.references :facility_owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
