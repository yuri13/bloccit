class PostsController < ApplicationController

  before_action :require_sign_in, except: :show

  def show
    # #find post that corresponds to id in params passed to show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    # # create an instance variable then assign an empty post
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)

    @post.user = current_user

# #if save successful display success message
    if @post.save
# #assign value to flash notice, any value will be available in next action then deleted
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
# #display error if save not successful
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

# #call destroy on post, if successful show first flash msg - delete successful
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
