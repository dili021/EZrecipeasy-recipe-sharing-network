class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @post = Post.new
    @timeline = Post.all.order("created_at DESC")
    @people = User.other_users(current_user)
  end


  def create
    @post = @current_user.posts.create(post_params)
    redirect_to :root
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
