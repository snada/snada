Rails.application.routes.draw do
  resources :pics
  root 'application#index'

  get '/login', to: redirect('/auth/github')
  get 'logout' => 'user_sessions#destroy'
  get '/auth/:provider/callback', to: 'user_sessions#create'

  resource :user_sessions, only: [:create]
  resources :posts
  resources :categories, only: [:show]
  resources :contacts, only: [:new, :create]
end
