Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # トップページ
  root to: 'shops#index'

  resources :shops do
    resources :reviews
  end

  namespace :users do
    resources :reviews, only: %w(edit update show destroy)
  end
end