class MoveColumnFromIngredientsToRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :description
    add_column :recipes, :description, :text, null: false
  end
end
