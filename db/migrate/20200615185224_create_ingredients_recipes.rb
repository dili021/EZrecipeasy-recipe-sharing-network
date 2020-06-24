class CreateIngredientsRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients_recipes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
