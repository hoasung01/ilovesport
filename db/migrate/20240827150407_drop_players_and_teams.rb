class DropPlayersAndTeams < ActiveRecord::Migration[7.1]
  def change
    drop_table :players
    drop_table :teams
  end
end
