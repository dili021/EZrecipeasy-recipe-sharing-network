class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :body, presence: true,
                   length: { maximum: 2000 }

  default_scope -> { order(created_at: :desc) }
end
