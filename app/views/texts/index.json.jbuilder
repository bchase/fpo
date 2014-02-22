json.array!(@texts) do |text|
  json.extract! text, :id, :name, :episode, :artist, :raw
  json.url text_url(text, format: :json)
end
