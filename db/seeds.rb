require 'CSV'

# テストユーザーの作成
EMAIL = 'test@example.com'
ADMIN_EAMIL = 'admin@example.com'
PASSWORD = 'password'

User.find_or_create_by(email: EMAIL) do |user|
  user.password = PASSWORD
  puts "サンプルユーザー登録完了"
end

# 管理者管理者ユーザー作成
AdminUser.find_or_create_by(email: ADMIN_EAMIL) do | admin_user |
  if Rails.env.development?
    admin_user.password = PASSWORD
    admin_user.password_confirmation = PASSWORD
  end
  puts "管理者ユーザーを作成しました"
end

# CSV読み込みスタイルのオプション
option = {headers: true}

# 系統マスタのレコードを作成
style_file_path = "db/csv/style.csv"
style_list = []
Style.destroy_all
CSV.foreach(style_file_path, option) do |row|
  style_list << row.to_h
end

Style.create!(style_list)
puts "系統モデルのCSVデータが登録できました。"

# ブランドマスタのテストレコードを作成
brand_file_path = "db/csv/brand.csv"
brand_list = []
Brand.destroy_all
CSV.foreach(brand_file_path, option) do |row|
  brand_list << row.to_h
end

Brand.create!(brand_list)
puts "ブランドモデルのCSVデータが登録できました。"