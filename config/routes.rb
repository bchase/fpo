Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :decks do
    resources :cards
  end
  get 'decks/:deck_id/text/line/:line_num/cards/new' => 'cards#new', 
    as: :card_builder_for_deck_and_text_line

  # resources :texts
end
