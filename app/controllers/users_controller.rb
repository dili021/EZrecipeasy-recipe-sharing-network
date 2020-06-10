class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @timeline = @user.posts.all.order("created_at DESC")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.full_name}"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    current_user.update(update_params)
    # @user.photo.attach(params[:photo])
    # current_user.cover_image.attach(params[:cover_image])
    redirect_to current_user
  end

  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :full_name)
  end

  def update_params
    params.require(:user).permit(:photo, :cover_image)
  end
end
