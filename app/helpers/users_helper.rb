module UsersHelper

  def follow_actions(user)
    return if current_user?(user)
    unless current_user.following?(user)
      render 'shared/follow_button'
    else
      render 'shared/unfollow_button'
    end
  end
end
