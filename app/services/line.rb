# TODO move to zhdict?

class Line < String
  def initialize(record, line_num)
    text = text_for(record)
    str  = text.hanzi_line(line_num)

    super str

    lookup_entries

    freeze
  end

  def each_char_with_entries(&block)
    chars.each_with_index do |char, idx|
      yield char, @entries[idx]
    end
  end

private
  def chars
    split('')
  end

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

  def lookup_entries
    @entries = slices_front_to_back.map do |str|
      if str.present?
        Entry.search_by_hanzi str
      else
        []
      end
    end
  end

  # TODO move to zhdict
  def slices_front_to_back
    slices = []
    idx    = 0
    last   = length - 1

    while idx <= last
      str = self[idx..-1]
      slices << str

      idx += 1
    end

    slices
  end
end
