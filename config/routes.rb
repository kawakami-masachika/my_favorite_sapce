Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # トップページ
  root to: 'shops#index'

  resources :shops do
    resources :reviews
    resource :like_shops, only: %w(create destroy)
  end

  namespace :users do
    resources :reviews, only: %w(edit update show destroy)
  end
end