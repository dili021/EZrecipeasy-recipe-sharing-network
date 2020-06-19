class Recipe < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_one_attached :photo
  has_many :likes
  
  has_many :ingredients_recipes, dependent: :destroy
  has_many :ingredients, through: :ingredients_recipes,
                         source: :ingredient

  
  validates :title, presence: true
  validates :description, presence: true,
                          length: { maximum: 8000 }

  default_scope -> { order(created_at: :desc) }

  def ingredient_tags
    ingredients.map(&:title)
  end

  def ingredient_tags=(tags)
    self.ingredients = tags.split(',').map do |tag|
      Ingredient.find_or_create_by(title: tag)
    end
  end
end
