class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.username == (params[:session][:username])
      log_in user
      redirect_to user
    else
      flash.now[:notice] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out_user
    flash[:notice] = 'Signed out successfully'
    redirect_to login_path
  end
end
