Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout' 
  resources :items
  resources :trips
  resources :gear_lists
  resources :users do
    resources :trips, only: [:new, :edit, :update, :destroy]
  end
end
