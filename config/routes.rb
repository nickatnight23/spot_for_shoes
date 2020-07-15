Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post 'signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#ominauth'

  # resources :reviews
  resources :shoes do
    resources :reviews, only: [:new, :create, :edit, :update, :delete, :index] #nested route
  end

  # resources :brands
  resources :users
  resources :brands
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

