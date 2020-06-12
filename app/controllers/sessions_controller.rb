class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.username == (params[:session][:username])
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
