require 'random_data'

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

 # Create Posts
 50.times do
   Post.create!(
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 # #call times on integer (100), will run block 100 times
 100.times do
   Comment.create!(
 # #sample returns a random element from Post.all
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 # Create Sponsored Posts
 75.times do
   SponsoredPost.create!(
     topic: topics.sample,
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     price: RandomData.random_price
   )
 end


 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Comment.count} comments created"
