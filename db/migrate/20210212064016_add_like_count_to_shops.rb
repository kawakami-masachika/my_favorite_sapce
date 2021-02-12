class AddLikeCountToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :likes_count, :integer, null: false, default: 0, comment: "お気に入り数"
  end
end
