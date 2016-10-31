class PostsController < ApplicationController
  def index
    # #declare instance variable @posts and assign it a collection of Post objects
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
