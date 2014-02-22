Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :decks
  # resources :texts
end
