module UsersHelper

  def follow_actions(user)
    return if current_user?(user)
    unless current_user.followed?(user)
      render 'shared/follow_button'
    else
      render 'shared/unfollow_button'
    end
  end

  def user_photo_upload(user)
    if user == @user
      render 'shared/img_upload'
    end
  end
end
