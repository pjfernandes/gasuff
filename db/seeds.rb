# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

500.times do
  puts "creating"

  Carbon.create(
    user_id: 1,
    researcher_id: (1..3).to_a.sample,
    latitude: (-80..80).to_a.sample,
    longitude: (-170..170).to_a.sample,
    class_sample: "CO2",
    concentration: (0..100).to_a.sample,
    ph: (0..7).to_a.sample,
    salinity: (0..100).to_a.sample,
    pressure: (0..5).to_a.sample,
    temperature: (0..40).to_a.sample,
    method: "Método X",
    equipment: "Equipamento X",
    date_analysis: Faker::Date.between(from: '2014-09-23', to: '2020-09-25'),
    date_sample: Faker::Date.between(from: '2014-09-23', to: '2020-09-25')
  )

  Methane.create(
    user_id: 1,
    researcher_id: (1..3).to_a.sample,
    latitude: (-80..80).to_a.sample,
    longitude: (-170..170).to_a.sample,
    class_sample: "CH4",
    concentration: (0..100).to_a.sample,
    ph: (0..7).to_a.sample,
    salinity: (0..100).to_a.sample,
    pressure: (0..5).to_a.sample,
    temperature: (0..40).to_a.sample,
    method: "Método X",
    equipment: "Equipamento X",
    date_analysis: Faker::Date.between(from: '2014-09-23', to: '2020-09-25'),
    date_sample: Faker::Date.between(from: '2014-09-23', to: '2020-09-25')
    )

  Sediment.create(
    user_id: 1,
    researcher_id: (1..3).to_a.sample,
    latitude: (-80..80).to_a.sample,
    longitude: (-170..170).to_a.sample,
    class_sample: "Sedimento",
    method: "Método X",
    equipment: "Equipamento X",
    date_analysis: Faker::Date.between(from: '2014-09-23', to: '2020-09-25'),
    date_sample: Faker::Date.between(from: '2014-09-23', to: '2020-09-25'),
    p_total: (0..100).to_a.sample,
    c_total: (0..100).to_a.sample,
    cinorg: (0..100).to_a.sample,
    calcidif: (0..100).to_a.sample,
    n_total: (0..100).to_a.sample,
    delta_13c: (0..100).to_a.sample,
    delta_15n: (0..100).to_a.sample
  )

end

puts "finished"
