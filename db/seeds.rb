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

Vacation.create(name: "Super Fun Vacay!", user_id: 1, destination_id: 8, budget: 1000, people: 2)


types_list = [
  "Museum", "Food", "Exercise", "Sightseeing", "Sporting Event", "Relax", "Social"
]

types_list.each do |type|
  Type.create(name: type)
end

activities_list = [
  ["Art Museum", 10],
  ["BEST Restaurant", 100],
  ["Strenuous Hike", 0],
  ["Famous Monuments Tour", 20],
  ["History Museum", 15],
  ["Hop-On, Hop-off Bus", 25],
  ["Football Game", 100],
  ["City Bike Tour", 30],
  ["Food Market Tour", 75],
  ["Baseball Game", 90],
  ["Easy Hike", 0],
  ["Super Famous Nightclub", 60],
  ["Day Spa", 125],
  ["Brewery Tour", 30]
]

activities_list.each do |activity|
  Activity.create(name: activity[0], price: activity[1], vacation_id: 1)
end
