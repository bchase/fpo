json.array!(@cards) do |card|
  json.extract! card, :id, :front, :back, :deck_id
  json.url card_url(card, format: :json)
end
