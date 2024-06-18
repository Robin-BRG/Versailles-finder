class Team < ApplicationRecord
  has_many :users
  has_many :team_markers
  has_many :markers, through: :team_markers
end
