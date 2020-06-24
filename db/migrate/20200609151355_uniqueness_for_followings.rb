class UniquenessForFollowings < ActiveRecord::Migration[6.0]
  def change
  end
  add_index :followings, [:follower_id, :followed_id], unique: true 
end
