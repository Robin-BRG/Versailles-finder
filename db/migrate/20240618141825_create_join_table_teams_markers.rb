class CreateJoinTableTeamsMarkers < ActiveRecord::Migration[7.1]
  def change
    create_join_table :teams, :markers do |t|
      # t.index [:team_id, :marker_id]
      # t.index [:marker_id, :team_id]
    end
  end
end
