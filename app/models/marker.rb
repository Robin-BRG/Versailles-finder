class Marker < ApplicationRecord
  has_many :team_markers
  has_many :teams, through: :team_markers
end
