class AddLikeCounterToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :likes, :integer, :default => 0
  end
end
