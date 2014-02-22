Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :decks do
    resources :cards
  end

  # resources :texts
end
