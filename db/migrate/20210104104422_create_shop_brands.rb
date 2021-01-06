class CreateShopBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_brands do |t|
      t.references :shop, null: false, foreign_key: true, index: false, comment: "ショップID"
      t.references :brand, null: false, foreign_key: true, index: false, comment: "ブランドID"

      t.timestamps
    end
    add_index :shop_brands, %W(shop_id brand_id), unique: true
  end
end
