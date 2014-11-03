Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons
  patch 'capture/:id', to: 'pokemons#capture', as: 'capture'
  patch 'damage/:id', to: 'pokemons#damage', as: 'damage'
  post 'new/:id', to: 'pokemons#new', as: 'new'
  post "create/:id", to: 'pokemons#create', as: "create"

end

