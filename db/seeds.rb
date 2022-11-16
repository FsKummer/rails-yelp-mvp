# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Restaurant.destroy_all

puts 'Starting seed'
10.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name, category: Restaurant::CATEGORIES.sample, address: Faker::Address.street_address,
                    phone_number: Faker::PhoneNumber.cell_phone)
  puts 'restaurant created'
  5.times do
    Review.create(content: Faker::Restaurant.review, rating: rand(0..5), restaurant:)
    puts 'review created'
  end
end
puts 'Seeds done :)'
