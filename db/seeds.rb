# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."
5.times do |i|
  flat = Flat.new
  flat.name = Faker::Lorem.sentence
  flat.address = Faker::Address.full_address
  flat.description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 10)
  flat.price_per_night = Faker::Number.within(range: 45..150)
  flat.number_of_guests = Faker::Number.within(range: 1..10)
  flat.image_link = "https://source.unsplash.com/1600x900/weekly?appartment/#{i}"
  flat.save
end

puts "Done!"
