class CreateTrainingGrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :training_grounds do |t|
      t.string :name
      t.references :facility_owner, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
