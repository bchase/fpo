# anki export

class Deck
  def export(format)
    # .TXT LINE
    deck.cards.map do |card|
      card.export(format)
    end.join("\n")
  end

end

class Card
  def export(format)
    "#{front}\t#{back_export}"
  end

  def back_export
    deck.cards.map do |card|
      front = card.front
      back  = back_to_s

      "#{front}\t#{back}"
    end.
      join("<br>").
      +(back)
  end
end

class Expression
  def export(format)

  end
end
