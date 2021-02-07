# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_07_045317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "brand_name", null: false
    t.string "brand_name_kana", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.float "rate", null: false, comment: "オススメ度"
    t.text "content", null: false, comment: "オススメポイント"
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.bigint "shop_id", null: false, comment: "ショップID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id", "user_id"], name: "index_reviews_on_shop_id_and_user_id", unique: true
  end

  create_table "shop_brands", force: :cascade do |t|
    t.bigint "shop_id", null: false, comment: "ショップID"
    t.bigint "brand_id", null: false, comment: "ブランドID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id", "brand_id"], name: "index_shop_brands_on_shop_id_and_brand_id", unique: true
  end

  create_table "shop_images", force: :cascade do |t|
    t.string "image", null: false, comment: "ショップ画像"
    t.bigint "shop_id", null: false, comment: "ショップID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_shop_images_on_shop_id"
  end

  create_table "shop_styles", force: :cascade do |t|
    t.bigint "shop_id", null: false, comment: "ショップID"
    t.bigint "style_id", null: false, comment: "系統マスタID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id", "style_id"], name: "index_shop_styles_on_shop_id_and_style_id", unique: true
  end

  create_table "shops", force: :cascade do |t|
    t.string "shop_name", null: false, comment: "ショップ名"
    t.time "open_time", null: false, comment: "開店時間"
    t.time "close_time", null: false, comment: "閉店時間"
    t.string "tel_number", limit: 11, null: false, comment: "電話番号"
    t.string "site_url", default: "", comment: "WEBサイトURL"
    t.string "instgram_url", default: "", comment: "instagram URL"
    t.text "shop_info", null: false, comment: "店舗情報"
    t.string "sales_info", default: "", comment: "定休日・営業情報"
    t.bigint "user_id", null: false, comment: "投稿ユーザーID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "treatment", null: false, comment: "取り扱い"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "taste", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reviews", "shops"
  add_foreign_key "reviews", "users"
  add_foreign_key "shop_brands", "brands"
  add_foreign_key "shop_brands", "shops"
  add_foreign_key "shop_images", "shops"
  add_foreign_key "shop_styles", "shops"
  add_foreign_key "shop_styles", "styles"
  add_foreign_key "shops", "users"
end
