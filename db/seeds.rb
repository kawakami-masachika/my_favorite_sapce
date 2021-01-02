require 'CSV'

# テストユーザーの作成
EMAIL = 'test@example.com'
PASSWORD = 'password'

User.find_or_create_by(email: EMAIL) do |user|
  user.password = PASSWORD
  puts "サンプルユーザー登録完了"
end

# CSV読み込みスタイルのオプション
option = {headers: true}

# 系統マスタのレコードを作成
style_file_path = "db/csv/style.csv"
style_list = []
CSV.foreach(style_file_path, option) do |row|
  style_list << row.to_h
end

Style.create!(style_list)
puts "系統モデルのCSVデータが登録できました。"