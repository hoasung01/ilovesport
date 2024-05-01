class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.references :team, null: false, foreign_key: true
      t.string :nationality
      t.date :birth_date

      t.timestamps
    end
  end
end
