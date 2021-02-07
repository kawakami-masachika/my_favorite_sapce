class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false, comment: "タイトル"
      t.float :rate, null: false, comment: "オススメ度"
      t.text :content, null: false, comment: "オススメポイント"
      t.references :user, null: false, foreign_key: true, index: false, comment: "ユーザーID"
      t.references :shop, null: false, foreign_key: true, index: false, comment: "ショップID"

      t.timestamps
    end
    add_index :reviews, %W(shop_id user_id), unique: true
  end
end
