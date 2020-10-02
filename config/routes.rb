Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout' 

  resources :items, only: [:index, :show, :new, :create]
  resources :trips, only: [:create, :update]

  resources :gear_lists do
    resources :items, only: [:show]
  end

  resources :users do
    resources :trips, only: [:index, :new, :edit, :destroy, :show]
  end

  post '/users/:user_id/trips', to: 'trips#index'

  get "/auth/:provider/callback", to: 'sessions#create_with_google'
end
