class Text < ActiveRecord::Base
  belongs_to :deck

  def hanzi_raw_arr
    raw_arr.select &:kanji?
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
  end
end
