class RenamePostsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :posts, :recipes
  end
end
