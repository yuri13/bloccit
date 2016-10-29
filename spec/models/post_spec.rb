require 'rails_helper'

RSpec.describe Post, type: :model do
  # #using let create new instance of Post class
    let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }

  # #we test whether post has attributes named title and body.
    describe "attributes" do
      it "has title and body attributes" do
        expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
      end
    end
  end
