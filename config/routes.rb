Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signin', to: 'sessions#new', as: 'signin'
  get '/signup', to: 'users#new', as: 'signup'
  delete '/logout', to: 'sessions#destroy', as: 'logout' 
  resources :items
  resources :trips
  resources :gear_lists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
