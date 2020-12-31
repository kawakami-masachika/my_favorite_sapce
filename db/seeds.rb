# テストユーザーの作成
EMAIL = 'test@example.com'
PASSWORD = 'password'

User.find_or_create_by(email: EMAIL) do |user|
  user.password = PASSWORD
  puts "サンプルユーザー登録完了"
end