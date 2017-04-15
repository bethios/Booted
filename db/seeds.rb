require 'random_data'

20.times do
  Wiki.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

puts "seed finished"
puts "#{Wiki.count} wikis created"
