class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @people = User.other_users(current_user)
    @user = User.find(params[:id])
    @timeline = @user.posts.all.order('created_at DESC')
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.full_name}"
      log_in @user
      redirect_to :root
    else
      render 'new'
    end
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :email,
                                 :full_name,
                                 :photo,
                                 :cover_image)
  end

  #   def update_params
  #     params.require(:user).permit(:photo, :cover_image)
  #   end
end
