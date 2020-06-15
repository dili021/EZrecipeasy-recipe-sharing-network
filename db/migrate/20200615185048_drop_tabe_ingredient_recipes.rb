class DropTabeIngredientRecipes < ActiveRecord::Migration[6.0]
  def change
    drop_table :ingredients_recipes
  end
end
