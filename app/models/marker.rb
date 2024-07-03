class Marker < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :team_markers
  has_many :teams, through: :team_markers
end
