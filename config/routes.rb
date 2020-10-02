Rails.application.routes.draw do
  # home
  root to: 'application#welcome'

  # Sign up, in and log out routes
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  post '/logout', to: 'sessions#destroy', as: 'logout' 

  # for google sign in
  get "/auth/:provider/callback", to: 'sessions#create_with_google'
  
  # for GearList scope method demonstration
  get '/most_popular', to: 'gear_lists#most_popular', as: 'most_popular'


  resources :gear_lists, only: [:index] do
    resources :items, only: [:show]
  end
  resources :items, only: [:index, :show, :new, :create]


  resources :users do
    resources :trips, only: [:index, :new, :edit, :destroy, :show]
  end
  resources :trips, only: [:create, :update]

  # for user profile trip filter
  post '/users/:user_id/trips', to: 'trips#index'
end
