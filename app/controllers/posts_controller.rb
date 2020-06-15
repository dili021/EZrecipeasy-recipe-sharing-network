class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @user = current_user
    @post = Post.new
    @timeline = current_user.my_timeline.includes( author: [:photo_attachment])
    @people = User.other_users(current_user).includes([:photo_attachment])
  end

  def create
    @post = @current_user.posts.create(post_params)
    if @post.save
      redirect_to :root
    else
      flash[:notice] = 'Empty post is not allowed'
      redirect_to :root

    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
