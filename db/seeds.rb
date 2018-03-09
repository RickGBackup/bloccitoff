# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create 10 users
10.times do
  name = Faker::Name.name
  first = name.split[0]
  email = Faker::Internet.email(first)
  password = Faker::Number.number(10)
  User.create!(name: name, email: email, password: password )
end

users = User.all

# Create a couple of known users for testing views
rick = User.create!(name: 'Rick', email: 'rick@example.com', password: 'abcdef')
jack = User.create!(name: 'Jack', email: 'jack@example.com', password: 'abcdef')

# Create 50 items, each with a random user
50.times do
  name = Faker::Company.bs
  user = users.sample
  Item.create!(name: name, user: user )
end

puts "#{User.count} users were created"
puts "#{Item.count} items were created"

