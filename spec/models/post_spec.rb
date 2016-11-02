require 'rails_helper'

RSpec.describe Post, type: :model do
  # #using let create new instance of Post class
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
# #create parent topic for post
  let(:topic) { Topic.create!(name: name, description: description) }
# #associate post with topic via topic.posts.create!, chained method call
  let(:post) { topic.posts.create!(title: title, body: body) }

  it { is_expected.to belong_to(:topic) }
  # #we test whether post has attributes named title and body.
    describe "attributes" do
      it "has title and body attributes" do
        expect(post).to have_attributes(title: title, body: body)
      end
    end
  end
