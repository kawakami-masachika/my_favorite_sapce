class CreateShopStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_styles do |t|
      t.references :shop, null: false, foreign_key: true, index: false, comment: "ショップID"
      t.references :style, null: false, foreign_key: true, index: false, comment: "系統マスタID"

      t.timestamps
    end
    add_index :shop_styles, %W(shop_id style_id), unique: true
  end

end
