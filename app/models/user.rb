class User < ApplicationRecord
  before_save { self.full_name = full_name.titleize}
  before_save {self.email = email.downcase}

  has_one_attached :photo
  has_one_attached :cover_image

  has_many :posts, dependent: :destroy
  
  has_many :outward_follows, class_name: "Following", 
                             foreign_key: :follower_id, 
                             dependent: :destroy
            
  has_many :followed_users, through: :outward_follows,
                            source: :followed
            
  has_many :inward_follows, class_name: "Following",
                            foreign_key: :followed_id,
                            dependent: :destroy          

  has_many :following_users, through: :inward_follows, 
                             source: :follower
  
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: {minimum: 5, maximum: 20}
  validates :full_name, presence: true, 
                        length: {minimum: 4, maximum: 200}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  scope :other_users, ->(user) { where.not(id: user)}

  def post_count
    posts.count
  end                  
  
  def follow(target_user)
    return if followed?(target_user)
    followed_users << target_user
  end
  
  def unfollow(target_user)
    followed_users.delete(target_user)
  end
  
  def followed?(target_user)
    followed_users.include?(target_user)
  end

  def following?(target_user)
    followed_users.include?(target_user)
  end

  def follow_count
    outward_follows.count
  end

  def follower_count
    following_users.count
  end  

end
