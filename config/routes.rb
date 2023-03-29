Rails.application.routes.draw do
  resources :books do
    resources :readers_cards
    resources :libraries
    resources :authors
    resources :genres
  end
  resources :users do
    resources :readers_cards
  end
  resources :readers_cards do
    resources :libraries
  end
  resources :genres do
    resources :books
  end
  resources :authors do
    resources :books
  end
  resources :libraries


end
