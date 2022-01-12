# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

500.times do
  puts "creating"
  Carbon.create(
    user_id: 1,
    researcher_id: 1,
    latitude: (-80..80).to_a.sample,
    longitude: (-170..170).to_a.sample,
    class_sample: "CO2"
    )
end

puts "finished"

500.times do
  puts "creating"
  Methane.create(
    user_id: 1,
    researcher_id: 1,
    latitude: (-80..80).to_a.sample,
    longitude: (-170..170).to_a.sample,
    class_sample: "CH4"
    )
end

puts "finished"
