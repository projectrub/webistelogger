Rails.application.routes.draw do
  get 'ranking/index'
  get 'training/index'
  get 'profile_date/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "public#home"
  get 'public/home'
  authenticated :user do
    resources :profile
    resources :date
    resources :training 
    post '/training/:id', to: 'training#create', as: 'create_training'
    resources :ranking
  end
  
  devise_for :users, controllers: 
  { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
