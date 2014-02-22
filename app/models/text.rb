class Text < ActiveRecord::Base
  belongs_to :deck

  def raw_arr
    raw.split("\n")
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
