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

  describe "GET show" do
    it "returns http success" do
# #pass my_post.id tp show as a parameter
      get :show, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
# #expect response to return show view
      get :show, {id: my_post.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: my_post.id}
# #expect post to equal my_post 
      expect(assigns(:post)).to eq(my_post)
    end
  end

  # #1
     describe "GET new" do
       it "returns http success" do
         get :new
         expect(response).to have_http_status(:success)
       end

  # #use render_template method to verify that coorect view is rendered
       it "renders the #new view" do
         get :new
         expect(response).to render_template :new
       end

  # #expect the @post instance variable to be initialized by PostsController#new
       it "instantiates @post" do
         get :new
         expect(assigns(:post)).not_to be_nil
       end
     end

     describe "POST create" do
  # #expect increase in count of Post instances in database by one
       it "increases the number of Post by 1" do
         expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
       end

  # #
       it "assigns the new post to @post" do
         post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
         expect(assigns(:post)).to eq Post.last
       end

  # #
       it "redirects to the new post" do
         post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
         expect(response).to redirect_to Post.last
       end
     end

  #  describe "GET edit" do
  #    it "returns http success" do
  #      get :edit
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

end
