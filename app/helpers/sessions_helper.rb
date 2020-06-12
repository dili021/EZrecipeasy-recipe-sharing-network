module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

  def authenticate_user
    return if user_logged_in?

    redirect_to login_path
  end

  def user_logged_in?
    !current_user.nil?
  end

  def log_out_user
    session.delete(:user_id)
    @current_user = nil
  end
end
