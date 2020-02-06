# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Like.destroy_all
Comment.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all

10.times do
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
  )
end

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.most_interesting_man_in_the_world,
    email: Faker::Internet.email,
    age: rand(10..80),
    city_id: rand(City.first.id..City.last.id)
  )
end

20.times do
  Gossip.create(
    user_id: rand(User.first.id..User.last.id),
    title: Faker::Quote.singular_siegler,
    content: Faker::ChuckNorris.fact,
    date: Faker::Time.backward(days: 10)
  )
end

10.times do
  Tag.create(
    title: '#'+Faker::Company.profession,
  )
end

# Gossip.each do
#   rand(1..Tag.count).times
#     JoinTableGossipTag.create(
#       gossip_id: rand(Gossip.first.id..Gossip.last.id)
#       tag_id: rand(Tag.first.id..Tag.last.id)
#     )
#   end
# end

20.times do
  JoinTableGossipTag.create(
    gossip_id: rand(Gossip.first.id..Gossip.last.id),
    tag_id: rand(Tag.first.id..Tag.last.id)
  )
end


20.times do
  Comment.create(
    user_id: rand(User.first.id..User.last.id),
    content: Faker::Quote.famous_last_words,
    gossip_id: rand(Gossip.first.id..Gossip.last.id)
  )
end

# 20.times do
#   CommentOfComment.create(
#     user_id: rand(User.first.id..User.last.id),
#     content: Faker::Quote.yoda,
#     comment_id: rand(Comment.first.id..Comment.last.id)
#   )
# end

20.times do
  like = Like.new(user_id: rand(User.first.id..User.last.id))
  if rand(0..1) == 1
    like.gossip_id = rand(Gossip.first.id..Gossip.last.id)
  else
    like.comment_id = rand(Comment.first.id..Comment.last.id)
  end
  like.save
end

# 10.times do 
#   PrivateMessage.create!(
#     content: Faker::Quote.famous_last_words,
#     recipient_id: rand(User.first.id..User.last.id), 
#     sender_id: rand(User.first.id..User.last.id)
#     )
# end 



