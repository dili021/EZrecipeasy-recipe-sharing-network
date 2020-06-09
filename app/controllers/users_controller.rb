class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.full_name}"
      redirect_to @user
    else
      render 'new'
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :full_name)
  end
end
