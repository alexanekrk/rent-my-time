# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning users, pigeons, bookings from the database..."
Pigeon.destroy_all
User.destroy_all
Booking.destroy_all

puts "Adding 3 users... Tom, Alexane and Pablo"

pablo = User.create(
  first_name: 'Pablo',
  last_name: 'Hennique',
  email: 'phennique@gmail.com',
  password: '111111'
)

alexane = User.create(
  first_name: 'Alexane',
  last_name: 'France',
  email: 'alexane@france.com',
  password: '111111'
)

tom = User.create(
  first_name: 'Tom',
  last_name: 'Gorilla',
  email: 'tom@grilla.com',
  password: '111111'
)

puts "Adding some pigeons..."

pigeons = []

10.times do
  pigeon = Pigeon.create!(
    name: Faker::Name.name,
    color: ["grey", "black", "yellow", "blue", "pink", "red", "green", "orange"].sample,
    address: ["1972 Notre Dame West, Montreal",
              "1200 Saint Jacques, Montreal",
              "5333 Casgrain Ave, Montreal",
              "4625 Rue Saint-Antoine O, Montreal",
              "5150 Chem. de la Cote des Neiges, Montreal",
              "4160 Saint-Catherine St, Westmount",
              "50 Rue de la Gauchetière O, Montreal",
              "2175 Rue de la Montagne #100, Montreal",
              "1433 City Councillors St, Montreal",
              "4328 St Laurent Blvd, Montreal",
              "994 Rue Rachel E, Montreal",
              "2180 Mont-Royal Ave E, Montreal"].sample,
    age: rand(1..8),
    price: rand(10..100),
    user_id: [pablo, alexane, tom].sample.id
  )
  pigeons.push(pigeon)
  puts "Create the pigeon id #{pigeon.id}"
end

10.times do
  booking = Booking.create!(
    start_date: Date.new,
    end_date: Date.new,
    location: Faker::Address.street_address,
    quantity: rand(1...20),
    pigeon_id: pigeons.sample.id,
    user_id: [pablo, alexane, tom].sample.id
  )
  puts "Create the booking id #{booking.id}"
end

puts "adding Montreal pigeons"

3.times do
  pigeon = Pigeon.create!(
    name: Faker::Name.name,
    color: ["grey", "black", "yellow", "blue", "pink", "red", "green", "orange"].sample,
    address: "Montreal",
    age: rand(1..8),
    price: rand(10..100),
    user_id: [pablo, alexane, tom].sample.id
  )
  pigeons.push(pigeon)
  puts "Create the montreal pigeon id #{pigeon.id}"
end

puts 'All done'
