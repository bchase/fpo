class Card < ActiveRecord::Base
  belongs_to :deck

  has_many :expressions

  def export(format)
    format = format.to_s

    if format.match(/anki/)
      export_anki
    else
      ''
    end
  end

  def export_anki
    "#{front}\t#{back_for_anki}\n"
  end

private
  def back_for_anki
    expressions.map(&:export_anki).join('<br>')
  end
end
