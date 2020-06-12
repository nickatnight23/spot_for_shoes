Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post 'signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :reviews
  resources :shoes do
    resources :reviews, only: [:new, :index] #nested route
  end

  # resources :brands
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
