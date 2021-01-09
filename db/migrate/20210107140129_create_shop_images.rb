class CreateShopImages < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_images do |t|
      t.json :images, null: false, comment: "ショップ画像"
      t.references :shop, null: false, foreign_key: true, comment: "ショップID"

      t.timestamps
    end
  end
end
