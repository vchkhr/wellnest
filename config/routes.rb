Rails.application.routes.draw do
  root 'home#index'
  
  # Auth
  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :password_resets
  get 'reset-password', to: 'password_resets#new', as: 'reset_password'
  get 'check-your-email', to: 'password_resets#check', as: 'check_your_email'

  # Admin Panel
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :coaches

  # App
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
  resources :invitations
  
  # Clients
  resources :clients
end
