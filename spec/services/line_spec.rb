require 'spec_helper'

describe Line do
  # TODO 
  #   dup'd from text_spec...
  let(:song_text) { create :text }

  let(:line_one) { song_text.raw.split("\n").first }
  let(:line_two) { song_text.raw.split("\n").second }
  let(:hanzi_line_two) { song_text.raw.split("\n").third }

  let(:deck)      { create :deck, text: song_text }

  let(:meishuode) { create :meishuode }
  let(:mei)       { create :mei }
  let(:mo)        { create :mo }

  describe '.initialize' do
    it 'takes a deck and a line number (for deck text)' do
      line = Line.new deck, 1

      line.should eq(line_one)
    end

    it 'takes a text and a line number' do
      line = Line.new song_text, 1

      line.should eq(line_one)
    end
  end

  describe '#to_s' do
  end

  describe '#inspect' do
  end

  describe '#each' do
  end
end
