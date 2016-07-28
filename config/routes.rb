Rails.application.routes.draw do
  root 'application#index'

  get '/login', to: redirect('/auth/github')
  get 'logout' => 'user_sessions#destroy'
  resource :user_sessions, only: [:create]
  get '/auth/:provider/callback', to: 'user_sessions#create'

  resources :posts

  resources :categories, only: [:show]
end
