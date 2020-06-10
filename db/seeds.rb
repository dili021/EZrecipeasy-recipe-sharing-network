# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User for testing
User.create!(username: "test_user",
             full_name: "Test User",
             email: "test_user@email.com")

# Populate database with users
30.times do |i|
  username = "#{Faker::Name.unique.first_name}_123"
  full_name = Faker::Name.name
  email = Faker::Internet.unique.email
  User.create!(username: username,
               full_name: full_name,
               email: email)
end

# Generate some follows
users = User.all
user = User.first
followers = users[5..10]
followers.each {|follower| follower.follow(user)}
10.times {|i| user.follow(users.sample)}

# Generate posts by users
users.each do |person|
  post = Faker::Lorem.sentence
  person.posts.create!(body: post)
end
