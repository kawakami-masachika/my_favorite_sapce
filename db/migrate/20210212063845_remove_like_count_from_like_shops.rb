class RemoveLikeCountFromLikeShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :like_shops, :likes_count, :integer
  end
end
