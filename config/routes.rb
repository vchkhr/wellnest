Rails.application.routes.draw do
  resources :coach_notifications
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
  resources :techniques
  resources :likes

  # Users
  resources :completed_steps
  get 'my-techniques', to: 'techniques#my', as: 'my_techniques'
  get 'recommended-techniques', to: 'techniques#recommended', as: 'recommended_techniques'
  get 'in-progress-techniques', to: 'techniques#in_progress', as: 'in_progress_techniques'
  get 'completed-techniques', to: 'techniques#completed', as: 'completed_techniques'

  # Coaches
  resources :coaches
  get 'update-coach-info', to: 'coaches#edit', as: 'update_coach_info'
  get 'all-techniques', to: 'techniques#all', as: 'all_techniques'
  resources :users_techniques

  # All others
  # resources :steps_techniques
  # resources :notifications
  # resources :problems_techniques
  # resources :steps
  # resources :coaches_problems
  # resources :users_problems
  # resources :problems
end
