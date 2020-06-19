class Ingredient < ApplicationRecord
  has_many :ingredients_recipes, dependent: :destroy

  has_many :recipes, through: :ingredients_recipes,
                     source: :recipe

end
