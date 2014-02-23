json.array!(@expressions) do |expression|
  json.extract! expression, :id, :card_id, :char_num
  json.url expression_url(expression, format: :json)
end
