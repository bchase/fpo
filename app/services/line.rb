class Line < String
  def initialize(record, line_num)
    text = text_for(record)
    str  = text.hanzi_line(line_num)
    super str
    freeze
  end

private
  def text_for(record)
    case record
    when Deck
      deck = record
      deck.text
    when Text
      text = record
    else
      raise TypeError.new "not a valid record class: #{record.class} for #{record.inspect}"
    end
  end
end
