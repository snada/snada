Rails.application.routes.draw do
  resources :pics
  root 'application#index'

  get 'login', to: 'application#login'
  get '/logout', to: 'user_sessions#destroy'
  get '/auth/:provider/callback', to: 'user_sessions#create'
  get '/about', to: 'application#about'

  resource :user_sessions, only: [:create]
  resources :posts
  resources :categories, only: [:show]
  resources :contacts, only: [:new, :create]
end
