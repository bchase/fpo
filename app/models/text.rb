class Text < ActiveRecord::Base
  belongs_to :deck

  def hanzi_line(line_num)
    idx = line_num - 1
    hanzi_raw_arr[idx]
  end

  def hanzi_raw_arr
    raw_arr.select &:has_kanji?
  end

  def raw_arr
    raw.split("\n").map do |str|
      Text::String.new str
    end
  end

  def raw
    Text::String.new super
  end

private
  # TODO 
  class String < ::String
    include Cloze::JapaneseStringHelpers
    alias :has_kanji? :kanji?
  end
end
