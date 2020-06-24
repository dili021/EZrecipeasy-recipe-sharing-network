class RemoveColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :photo, :string
    remove_column :users, :cover_image, :string
  end
end
