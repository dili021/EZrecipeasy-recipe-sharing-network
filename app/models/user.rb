class User < ApplicationRecord
  before_save { self.full_name = full_name.titleize }
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_one_attached :photo
  has_one_attached :cover_image

  validates :photo, content_type: %i[png jpg jpeg]
  validates :cover_image, content_type: %i[png jpg jpeg]

  has_many :recipes, foreign_key: :author_id, dependent: :destroy

  has_many :outward_follows, class_name: 'Following',
                             foreign_key: :follower_id,
                             dependent: :destroy

  has_many :followed_users, through: :outward_follows,
                            source: :followed

  has_many :inward_follows, class_name: 'Following',
                            foreign_key: :followed_id,
                            dependent: :destroy

  has_many :following_users, through: :inward_follows,
                             source: :follower

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 5, maximum: 20 }
  validates :full_name, presence: true,
                        length: { minimum: 4, maximum: 200 }

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  scope :other_users, ->(user) { where.not(id: user.id) }

  def my_timeline
    followed_user_ids = []
    followed_users.each { |user| followed_user_ids << user.id }
    Recipe.where(author: followed_user_ids + [id])
  end

  def post_count
    recipes.count
  end

  def follow(target_user)
    return if followed?(target_user) || target_user == current_user

    followed_users << target_user
  end

  def unfollow(target_user)
    followed_users.delete(target_user)
  end

  def followed?(target_user)
    followed_users.include?(target_user)
  end

  def following?(target_user)
    following_users.include?(target_user)
  end

  def follow_count
    followed_users.count
  end

  def follower_count
    following_users.count
  end
end
