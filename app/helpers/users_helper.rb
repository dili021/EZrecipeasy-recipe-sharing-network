module UsersHelper
  def follow_actions(user)
    return if current_user?(user)

    if current_user.followed?(user)
      render 'shared/unfollow_button'
    else
      render 'shared/follow_button'
    end
  end

  def user_photo_upload(user)
    render 'shared/img_upload' if user == @user
  end

  def follow_status(user)
    'followed' if current_user.followed?(user)
  end
end
