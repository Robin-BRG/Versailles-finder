# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clear existing data
Marker.destroy_all
TeamMarker.destroy_all
Team.destroy_all
User.destroy_all

# Create Teams
5.times do
  Team.create!(
    name: Faker::Team.name
  )
end

# Helper method to generate random latitude and longitude within a range
def random_in_range(min, max)
  rand * (max - min) + min
end

# Create Markers in Versailles
20.times do
  Marker.create!(
    name: Faker::Lorem.word,
    content: Faker::Lorem.paragraph,
    enigma: Faker::Lorem.sentence,
    found: Faker::Boolean.boolean,
    radius: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    latitude: random_in_range(48.7969, 48.8156), # Latitude range for Versailles
    longitude: random_in_range(2.1165, 2.1444), # Longitude range for Versailles
    address: Faker::Address.street_address + ", Versailles, France", # Adding address
    created_at: Faker::Time.backward(days: 365),
    updated_at: Faker::Time.backward(days: 365)
  )
end

# Create Users
20.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',  # Use a default password
    password_confirmation: 'password',  # Ensure password confirmation matches
    reset_password_token: Faker::Internet.uuid,
    reset_password_sent_at: Faker::Time.backward(days: 365),
    remember_created_at: Faker::Time.backward(days: 365),
    created_at: Faker::Time.backward(days: 365),
    updated_at: Faker::Time.backward(days: 365),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    team_id: Team.pluck(:id).sample,
    leader: Faker::Boolean.boolean
  )
end

# Create TeamMarkers
50.times do
  TeamMarker.create!(
    team_id: Team.pluck(:id).sample,
    marker_id: Marker.pluck(:id).sample,
    created_at: Faker::Time.backward(days: 365),
    updated_at: Faker::Time.backward(days: 365)
  )
end

puts "Seeding completed!"
