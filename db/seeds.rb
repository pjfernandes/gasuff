# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

60000.times do
  puts "creating"
  Carbon.create(
    user_id: 1,
    researcher_id: 1,
    latitude: (-80..80).to_a.sample,
    longitude: (-170..170).to_a.sample
    )
end

puts "finished"
