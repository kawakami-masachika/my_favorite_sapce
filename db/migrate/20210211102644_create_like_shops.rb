class CreateLikeShops < ActiveRecord::Migration[6.0]
  def change
    create_table :like_shops do |t|
      t.references :shop, null: false, foreign_key: true, index: false, comment: "ショップID"
      t.references :user, null: false, foreign_key: true, index: false, comment: "ユーザーID"
      t.integer :likes_count, null: false, default: 0, comment: "お気に入り数"

      t.timestamps
    end
    add_index :like_shops, %W(shop_id user_id), unique: true
  end
end
