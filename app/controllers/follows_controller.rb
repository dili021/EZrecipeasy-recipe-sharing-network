class FollowsController < ApplicationController
  before_action :user_logged_in?

  def follow_user
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to @user
  end

  def unfollow_user
    @user = current_user.followed_users.find(params[:followed_id])
    current_user.unfollow(@user)
    redirect_to @user
  end
end
