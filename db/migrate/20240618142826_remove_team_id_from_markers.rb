class RemoveTeamIdFromMarkers < ActiveRecord::Migration[7.1]
  def change
    remove_column :markers, :team_id, :bigint
  end
end
