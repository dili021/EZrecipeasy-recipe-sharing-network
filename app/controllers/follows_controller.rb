class FollowsController < ApplicationController
  before_action :user_logged_in?

  def follow_user
    p params
  @user = User.find(params[:id])
  current_user.follow(@user)
  redirect_to @user
  end

  def unfollow_user
    @user = Following.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to @user
  end

end
