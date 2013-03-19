class PostsController < ApplicationController
  def new
    # @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post])
    redirect_to user_path(@user)
  end

  def index
     @posts = Post.all
  end
end
