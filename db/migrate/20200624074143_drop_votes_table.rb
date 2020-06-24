class DropVotesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :votes
  end
end
