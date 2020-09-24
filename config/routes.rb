Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signin', to: 'sessions#new', as: 'signin'
  ger '/signup', to: 'users#new', as: 'signup'
  resources :items
  resources :trips
  resources :gear_lists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
