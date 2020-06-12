class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @user = current_user
    @post = Post.new
    @timeline = current_user.my_timeline
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
