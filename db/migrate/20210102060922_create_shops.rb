class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false, comment: "ショップ名"
      t.time :open_time, null: false, comment: "開店時間"
      t.time :close_time, null: false, comment: "閉店時間"
      t.string :tel_number, null: false, :limit => 11, comment: "電話番号"
      t.string :site_url, default: '', comment: "WEBサイトURL"
      t.string :instgram_url, default: '', comment: "instagram URL"
      t.text :shop_info, null: false, comment: "店舗情報"
      t.string :sales_info, default: '', comment: "定休日・営業情報"
      t.references :user, null: false, foreign_key: true, comment: "投稿ユーザーID"

      t.timestamps
    end
  end
end
