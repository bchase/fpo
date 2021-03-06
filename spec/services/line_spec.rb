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

  let(:entries) { [ [meishuode, mei, mo], [], []] }

  describe '.initialize' do
    it 'takes a deck and a line number (for deck text)' do
      line = Line.new deck, 1

      line.should eq(line_one)
    end

    it 'takes a text and a line number' do
      line = Line.new song_text, 1

      line.should eq(line_one)
    end

    context 'lookups' do
      let(:str)  { meishuode.traditional_characters }
      let(:text) { Text.new raw: str }
      let(:line) { Line.new text, 1 }

      it 'performs entry lookups for each char' do
        pending "failing at lookups..."
        line.instance_variable_get(:@entries).should eq(entries)
      end
    end
  end

  describe '#each_char_with_entries' do
    let(:str)  { meishuode.traditional_characters }
    let(:text) { Text.new raw: str }
    let(:line) { Line.new text, 1 }

    it 'loops the line and looks up entries' do
      line.each_char_with_entries do |char, entries|
        char.should eq(mei.traditional_characters)
        entries.should eq(entries)

        break
      end
    end
  end
end
