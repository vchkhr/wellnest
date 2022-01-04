Rails.application.routes.draw do
  root 'home#index'

  # Admin Panel
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Auth
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # Password Reset
  resources :password_resets
  get 'reset-password', to: 'password_resets#new', as: 'reset_password'
  get 'check-your-email', to: 'password_resets#check', as: 'check_your_email'
  
  # User
  resources :users
  get 'update-user-info', to: 'users#edit', as: 'update_user_info'

  # App
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
  resources :invitations
  
  # Clients
  resources :clients
  get 'update-client-info', to: 'clients#edit', as: 'update_client_info'

  # Coaches
  resources :coaches
  get 'update-coach-info', to: 'coaches#edit', as: 'update_coach_info'
end
