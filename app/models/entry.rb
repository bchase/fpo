class Entry < ActiveRecord::Base
  include Zhdict::Word
  def trad; traditional_characters; end
  def simp; simplified_characters; end
  def pron; pronunciation; end

  def export(format)
    format = format.to_s

    if format.match(/anki/)
      export_anki
    else
      ''
    end
  end

  def export_anki
    "#{traditional_characters}<br>" +
    "#{simplified_characters}<br>" +
    "#{pronunciation}<br>" +
    "#{glosses_to_s}<br>"
  end

private
  def glosses_to_s
    idx = 1
    glosses.map {|gloss|
      str = "#{idx}: #{gloss}"
      idx += 1
      str
    }.join("<br>")
  end
end
