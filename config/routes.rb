Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions'}

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
  resources :libraries do
    resources :readers_cards
  end

  root to: "home#index"

  get 'download_libraries_users_pdf', to: "downloader#download_libraries_users_pdf"
  get 'download_libraries_pdf', to: "downloader#download_libraries_pdf"
  get 'download_users_pdf', to: "downloader#download_users_pdf"
  get 'download_libraries_users_csv', to: "downloader#download_libraries_users_csv"
end
