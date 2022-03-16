# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Airport.destroy_all

airports = []
  airports[0] = Airport.create(
  code: "LAX (Los Angeles)")
  airports[1] = Airport.create(
  code: "SFO (San Francisco)")
  airports[2] = Airport.create(
  code: "NYC (New York City)")
  airports[3] = Airport.create(
  code: "SEA (Seattle)")
  airports[4] = Airport.create(
  code: "DEN (Denver)")
  airports[5] = Airport.create(
  code: "ORD (Chicago)")

  p "Created #{Airport.count} Airports."

  Flight.destroy_all

  Date.new(2022, 3, 15).upto(Date.new(2022, 4, 15)).each do |d|
    airports.each do |departure|
      airports.each do |arrival|
        next if departure == arrival
            3.times {
            Flight.create(
              start: (d + rand(07..23).hour + rand(0..60).minutes).to_datetime,
              duration: Faker::Number.within(range: 60..600),
              departure_airport_id: departure.id,
              arrival_airport_id: arrival.id)
            }
            end
          end
        end


p "Created #{Flight.count} flights."
