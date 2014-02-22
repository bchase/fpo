Song = Struct.new(:name, :artist, :lyrics)

# name = "Shan Qiu - Jonathan Lee (山丘 - 李宗盛)"
name   = "山丘"
artist = "Jonathan Lee (李宗盛)"
lyrics = "想說卻還沒說的 還很多
Xiang shuo que hai mei shuo de hai hen duo
攢着是因為想寫成歌
Zan zhe shin yin wei xiang xie cheng ge"

song  = Song.new name, artist, lyrics



Given(/^I've just created a Deck$/) do
  @deck = @user.decks.build
  text  = Text.new \
    name:   song.name,
    artist: song.artist,
    raw:    song.lyrics
  @deck.text = text
  @deck.save
end

Given(/^I've been redirected to the Card builder$/) do
  visit card_builder_for_deck_and_text_line_path(@deck, 1)
end

Then(/^there should be one Card in the Deck$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^that card should have a target Word with multiple glosses$/) do
  pending # express the regexp above with the code you wish you had
end
