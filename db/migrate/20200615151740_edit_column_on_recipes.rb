class EditColumnOnRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :body, :string, :null => false
    rename_column :recipes, :body, :title
    
  end
end
