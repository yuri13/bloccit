class PostsController < ApplicationController
  def index
    # #declare instance variable @posts and assign it a collection of Post objects
    @posts = Post.all
  end

  def show
    # #find post that corresponds to id in params passed to show
    @post = Post.find(params[:id])
  end

  def new
    # # create an instance variable then assign an empty post
    @post = Post.new
  end

  def create
# #create new instance of Post
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

# #if save successful display success message
    if @post.save
# #assign value to flash notice, any value will be available in next action then deleted
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
# #display error if save not successful
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end
end
