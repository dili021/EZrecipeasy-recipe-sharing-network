class Following < ApplicationRecord
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"
  validates :follower_id, uniqueness: { scope: :followed_id }

  def self_follow
    return unless follower_id == followed_id
    errors.add(:follower_id, "Don't be a narcissist")
  end
end
