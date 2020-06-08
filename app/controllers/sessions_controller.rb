class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:username])  
      log_in user
      redirect_to user
    else
      flash.now[:warning] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
  end
end
