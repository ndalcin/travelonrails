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

Vacation.create(name: "Super Fun Vacay!", date: "Sometime in 2018", user_id: 1, destination_id: 8, budget: 1000, length: 20)
Vacation.create(name: "British Invasion", date: "Sometime in 2019", user_id: 2, destination_id: 13, budget: 2000, length: 10)

types_list = [
  "Museum", "Food", "Exercise", "Sightseeing", "Sporting Event", "Relax", "Social"
]

types_list.each do |type|
  Type.create(name: type)
end

activities_list = [
  ["Art Museum", 10, 1, 6, 1],
  ["BEST Restaurant", 100, 2, 9, 1],
  ["Strenuous Hike", 0, 3, 7, 1],
  ["Famous Monuments Tour", 20, 4, 6, 1],
  ["History Museum", 15, 1, 5, 1],
  ["Hop-On, Hop-off Bus", 25, 4, 6, 1],
  ["Football Game", 100, 5, 8, 1],
  ["City Bike Tour", 30, 4, 8, 2],
  ["Food Market Tour", 75, 2, 9, 2],
  ["Baseball Game", 90, 5, 7, 2],
  ["Easy Hike", 0, 3, 6, 2],
  ["Super Famous Nightclub", 60, 8, 8, 2],
  ["Day Spa", 125, 7, 8, 2],
  ["Brewery Tour", 30, 8, 10, 1]
]

activities_list.each do |activity|
  Activity.create(name: activity[0], price: activity[1], type_id: activity[2], rating: activity[3], vacation_id: activity[4])
end
