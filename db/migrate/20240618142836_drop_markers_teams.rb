class DropMarkersTeams < ActiveRecord::Migration[7.1]
  def change
    drop_table :markers_teams
  end
end
