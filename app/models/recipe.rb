class Recipe < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :ingredients_recipes
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
    self.ingredients = tags.split(' ').map do |tag|
      Ingredient.where(title: tag).first_or_create
    end
  end
end
