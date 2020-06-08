class User < ApplicationRecord
  before_save { self.full_name = full_name.titleize}
  
  has_many :posts, dependent: :destroy
  
  has_many :outward_follows, class_name: :following, 
                             foreign_key: :follower_id, 
                             dependent: :destroy
            
  has_many :followed_users, through: :outward_follows,
                            source: :followed
            
  has_many :inward_follows, class_name: :following,
                            foreign_key: :followed_id,
                            dependent: :destroy          

  has_many :following_users, through: :followings, 
                             source: :follower
  
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: {minimum: 5, maximum: 20}
  validates :full_name, presence: true, 
                        length: {minimum: 4, maximum: 200}
  
end
