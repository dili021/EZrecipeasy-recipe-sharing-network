class SessionsController < ApplicationController
  def new
    flash[:notice] = "You're already logged in" if user_logged_in?
    redirect_to root_path if user_logged_in?
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.username == (params[:session][:username])
      flash[:notice] = "Welcome back #{user.username}"
      log_in user
      redirect_to :root
    else
      flash.now[:notice] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out_user
    redirect_to login_path
  end
end
