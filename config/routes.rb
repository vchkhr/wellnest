Rails.application.routes.draw do
  root 'home#index'
  
  # Auth
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :password_resets

  # Admin Panel
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :coaches

  # App
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
  
  # Clients
  resources :clients
  get 'end-cooperation', to: 'clients#end_cooperation', as: 'end_cooperation'
end


