Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # トップページ
  root to: 'shops#index'
  resources :users, only: %W() do
    resources :shops
  end
end
