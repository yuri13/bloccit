require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # #we create a post and asign it my_post using let. use RandomData to give title and body
  # #create a parent topic name my_topic
    let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  # #update how we create my_post
    let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


  describe "GET show" do
    it "returns http success" do
# #pass my_post.id tp show as a parameter
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
# #expect response to return show view
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, topic_id: my_topic.id, id: my_post.id
      expect(assigns(:post)).to eq(my_post)
    end
  end

  # #1
     describe "GET new" do
       it "returns http success" do
         get :new, topic_id: my_topic.id
         expect(response).to have_http_status(:success)
       end

  # #use render_template method to verify that coorect view is rendered
       it "renders the #new view" do
         get :new, topic_id: my_topic.id
         expect(response).to render_template :new
       end

  # #expect the @post instance variable to be initialized by PostsController#new
       it "instantiates @post" do
         get :new, topic_id: my_topic.id
         expect(assigns(:post)).not_to be_nil
       end
     end

     describe "POST create" do
  # #expect increase in count of Post instances in database by one
       it "increases the number of Post by 1" do
         expect{post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
       end

  # #
       it "assigns the new post to @post" do
         post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
         expect(assigns(:post)).to eq Post.last
       end

  # #
       it "redirects to the new post" do
         post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
         expect(response).to redirect_to [my_topic, Post.last]
       end
     end

     describe "GET edit" do
       it "returns http success" do
         get :edit, topic_id: my_topic.id, id: my_post.id
         expect(response).to have_http_status(:success)
       end

       it "renders the #edit view" do
         get :edit, topic_id: my_topic.id, id: my_post.id
   # #expect edit view to render
         expect(response).to render_template :edit
       end

   # #test that edit assigns the correct post to be updated
       it "assigns post to be updated to @post" do
         get :edit, topic_id: my_topic.id, id: my_post.id

         post_instance = assigns(:post)

         expect(post_instance.id).to eq my_post.id
         expect(post_instance.title).to eq my_post.title
         expect(post_instance.body).to eq my_post.body
       end
     end

     describe "PUT update" do
       it "updates post with expected attributes" do
         new_title = RandomData.random_sentence
         new_body = RandomData.random_paragraph

         put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}

   # #test that @post was updated
         updated_post = assigns(:post)
         expect(updated_post.id).to eq my_post.id
         expect(updated_post.title).to eq new_title
         expect(updated_post.body).to eq new_body
       end

       it "redirects to the updated post" do
         new_title = RandomData.random_sentence
         new_body = RandomData.random_paragraph

         put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
         expect(response).to redirect_to [my_topic, my_post]
       end
     end

     describe "DELETE destroy" do
       it "deletes the post" do
         delete :destroy, topic_id: my_topic.id, id: my_post.id
   # #search the database for a post with equal id to my_post.id
         count = Post.where({id: my_post.id}).size
         expect(count).to eq 0
       end

       it "redirects to topic show" do
   # #update delete :destroy request to include the id of the parent topic
         delete :destroy, topic_id: my_topic.id, id: my_post.id
   # #redirects to topics show instead of posts index view
         expect(response).to redirect_to my_topic
       end
     end

end
