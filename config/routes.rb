Rails.application.routes.draw do
  root to: "public#home"
  get 'public/home'
  authenticated :user do
    resources :profile
  end
  devise_for :users, controllers: 
  { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
