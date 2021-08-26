# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


# USERS SEED
puts 'seeding users...'
3.times do
  user = User.new(email: Faker::Internet.email)
  user.password = '#$taawktljasktlw4aaglj'
  user.encrypted_password = '#$taawktljasktlw4aaglj'
  user.role = 'Restaurant'
  user.save!
end

# BASKETS SEED
puts 'seeding baskets...'
10.times do
  basket = Basket.new(name: Faker::Artist.name, description: Faker::Quote.famous_last_words, address: 'R. Jericó, 193, Vila Madalena, São Paulo', price: Faker::Number.between(from: 10, to: 10) , stock: 1)
  basket.user_id = User.all.sample.id
  basket.save!
end

# ORDERS SEED

puts 'seeding orders...'
5.times do
  order = Order.new()
  basket = Basket.all.sample
  order.basket_id = basket.id
  order.price = basket.price
  order.status = 'requested'
  order.user_id = User.all.sample.id
  order.save!
end

#puts 'seeding reviews...'
#baskets = Basket.all
#users = User.all
#baskets.each do |basket|
#  review = Review.new(title: Faker::Team, content: Faker::Quotes, rating: 3)
#  review.basket = basket
#  review.user_id = User.all.sample.id
#  review.save!
#end

puts 'done!'
