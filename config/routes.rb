Rails.application.routes.draw do
  devise_for :users
  # トップページ
  root to: 'shops#index'
end
