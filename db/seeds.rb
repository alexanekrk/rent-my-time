# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clean the database..."
Pigeon.destroy_all

puts "Add some pigeons..."

10.times do
  pigeon = Pigeon.create(
    name: Faker::Name.name,
    color: %w[grey black yellow blue pink red green orange].sample,
    age: rand(1..8),
    price: rand(10..100),
    user_id: '1'
  )
  puts "Create the pigeon id #{pigeon.id}"
end

puts 'All done'
