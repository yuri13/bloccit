require 'random_data'

 # Create Posts
 50.times do
 # #use create! to raise an error if there is issue with data
   Post.create!(
 # #methods from a class that does not exist yet, wishful coding
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

 # #creates Questions
 100.times do
   Question.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     resolved: false
   )
 end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
