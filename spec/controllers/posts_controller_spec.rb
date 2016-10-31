require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # #we create a post and asign it my_post using let. use RandomData to give title and body
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index
# #because test create one post we expect index to return an array of one item
      expect(assigns(:posts)).to eq([my_post])
    end
  end
  # commented out until implementation completed
  #  describe "GET show" do
  #    it "returns http success" do
  #      get :show
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  #  describe "GET edit" do
  #    it "returns http success" do
  #      get :edit
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

end
