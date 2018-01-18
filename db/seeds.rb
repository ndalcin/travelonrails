# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Test User", email: "test@gmail.com", password_digest: "123456")
User.create(name: "Mr Potato Head", email: "hotpotato@gmail.com", password_digest: "abcdef")

destinations_list = [
  ["Washington,DC", "USA"],
  ["Bangkok", "Thailand"],
  ["Miami, FL", "USA"],
  ["Sydney", "Australia"],
  ["Tokyo", "Japan"],
  ["Koh Phi Phi", "Thailand"],
  ["Dublin", "Ireland"],
  ["Los Angeles, CA", "USA"],
  ["Mexico City", "Mexico"],
  ["New York, NY", "USA"],
  ["Tel Aviv", "Israel"],
  ["Bali", "Indonesia"],
  ["London", "England"],
  ["Barcelona", "Spain"],
  ["Portland, OR", "USA"]
]

destinations_list.each do |destination|
  Destination.create(city: destination[0], country: destination[1])
end


types_list = [
  "Museum", "Food", "Exercise", "Sightseeing", "Sporting Event", "Relax", "Social"
]

types_list.each do |type|
  Type.create(name: type)
end

# activities_list = [
#   ["Art Museum", 10, 1, 6],
#   ["BEST Restaurant", 100, 2, 9],
#   ["Strenuous Hike", 0, 3, 7],
#   ["Famous Monuments Tour", 20, 4, 6],
#   ["History Museum", 15, 1, 5],
#   ["Hop-On, Hop-off Bus", 25, 4, 6],
#   ["Football Game", 100, 5, 8],
#   ["City Bike Tour", 30, 4, 8],
#   ["Food Market Tour", 75, 2, 9],
#   ["Baseball Game", 90, 5, 7],
#   ["Easy Hike", 0, 3, 6],
#   ["Super Famous Nightclub", 60, 8, 8],
#   ["Day Spa", 125, 7, 8],
#   ["Brewery Tour", 30, 8, 10]
# ]
#
# activities_list.each do |activity|
#   Activity.create(name: activity[0], price: activity[1], type_id: activity[2], rating: activity[3])
# end
