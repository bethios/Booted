require 'random_data'

5.times do
  User.create!(
    username: Faker::Internet.user_name(5..8),
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20)
  )
end

users = User.all

20.times do
  Wiki.create!(
    title: Faker::Food.ingredient,
    body: RandomData.random_paragraph,
    user: users.sample
  )
end

User.create!(
    email: 'admin@gmail.com',
    password: 'helloworld',
    role: 'admin',
    username: "admin"
)

User.create!(
    email: 'premium@gmail.com',
    password: 'helloworld',
    role: 'premium',
    username: 'premium'
)

User.create!(
    email: 'standard@gmail.com',
    password: 'helloworld',
    role: 'standard',
    username: 'standard'
)

puts "seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
