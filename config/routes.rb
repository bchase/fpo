Rails.application.routes.draw do
  resources :decks

  devise_for :users
  root to: 'home#index'
end
