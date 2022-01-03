Rails.application.routes.draw do
  root 'home#index'
  
  # Auth
  resources :users
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :password_resets
  
  resources :clients

  # Admin Panel
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :coaches

  # App
end


