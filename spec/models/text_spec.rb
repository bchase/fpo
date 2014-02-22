require 'spec_helper'

describe Text do
  let(:song_text) { create :text }

  let(:line_one) { song_text.raw.split("\n").first }
  let(:line_two) { song_text.raw.split("\n").second }
  let(:hanzi_line_two) { song_text.raw.split("\n").third }


  describe '#hanzi_line' do
    it 'returns the line for the passed index (base 1), relative to all lines containing hanzi' do
      song_text.hanzi_line(1).should eq(line_one)
      song_text.hanzi_line(2).should eq(hanzi_line_two)
    end
    it 'accepts strings' do
      song_text.hanzi_line('1').should eq(line_one)
    end
  end

  describe '#hanzi_raw_arr' do
    it 'returns only lines of raw that contain hanzi, as an array' do
      song_text.hanzi_raw_arr.first.should eq(line_one)
      song_text.hanzi_raw_arr.second.should eq(hanzi_line_two)
    end
  end

  describe '#raw_arr' do
    let(:line_one) { song_text.raw.split("\n").first }
    let(:line_two) { song_text.raw.split("\n").second }

    it 'returns a chomped array of raw' do
      song_text.raw_arr.first.should eq(line_one)
      song_text.raw_arr.second.should eq(line_two)
    end
  end

  describe Text::String do
    let(:str) { Text::String.new }

    it 'responds to .kanji? calls' do
      str.should respond_to(:kanji?)
    end
  end
end
