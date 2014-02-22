Song = Struct.new(:name, :artist, :lyrics)

# name = "Shan Qiu - Jonathan Lee (山丘 - 李宗盛)"
name   = "山丘"
artist = "Jonathan Lee (李宗盛)"
lyrics = "想說卻還沒說的 還很多
Xiang shuo que hai mei shuo de hai hen duo
攢着是因為想寫成歌
Zan zhe shin yin wei xiang xie cheng ge"

song  = Song.new name, artist, lyrics



Given(/^I visit the new Deck page$/) do
  visit new_deck_path
end

Given(/^I select "(.*?)" from "(.*?)"$/) do |item, dropdown|
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in "(.*?)" with the song name$/) do |_name|
  fill_in :deck_text_attributes_name, with: song.name
end

When(/^I fill in "(.*?)" with the artist's name$/) do |_artist|
  fill_in :deck_text_attributes_artist, with: song.artist
end

When(/^I fill in "(.*?)" with the lyrics$/) do |_lyrics|
  fill_in :deck_text_attributes_raw, with: song.lyrics
end

Then(/^I should see the first line of the song$/) do
  first_line = song.lyrics.split("\n").first
  page.should have_content(first_line)
end

Then(/^I should have a new Deck$/) do
  @user.decks.count.should eq(1)
end

Given(/^I have a populated Deck$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I navigate to that Deck$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see that Deck as an Anki export$/) do
  pending # express the regexp above with the code you wish you had
end
