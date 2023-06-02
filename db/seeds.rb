require "open-uri"

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
  pigeon = Pigeon.new(
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
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user_id: [pablo, alexane, tom].sample.id
  )
  rand_photo = ["https://www.allaboutbirds.org/guide/assets/photo/308074031-480px.jpg",
                "https://cdn.download.ams.birds.cornell.edu/api/v1/asset/308074331/1800",
                "https://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/8/2023/03/GettyImages-1127204610-600x400.jpg",
                "https://bc.ctvnews.ca/content/dam/ctvnews/en/images/2023/1/6/pigeon-1-6221027-1673045738764.jpg",
                "https://inaturalist-open-data.s3.amazonaws.com/photos/96934693/medium.jpg",
                "https://cdn.branchcms.com/Yj0Dao1bVx-1285/images/blogs/big-pigeon-up-close.jpg",
                "https://transcode-v2.app.engoo.com/image/fetch/f_auto,c_lfill,w_300,dpr_3/https://assets.app.engoo.com/images/5QVey0Z9fxgXanyJYctsnZ.jpeg",
                "https://www.npausa.com/images/mainimage1.jpg"].sample
  file = URI.open(rand_photo)
  pigeon.photo.attach(io: file, filename: 'pigeon_photo.png', content_type: "image/png")

  pigeon.save

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

puts 'All done'
