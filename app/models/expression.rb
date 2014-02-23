class Expression < ActiveRecord::Base
  belongs_to :card

  has_and_belongs_to_many :entries

  def export(format)
    format = format.to_s

    if format.match(/anki/)
      export_anki
    else
      ''
    end
  end

  def export_anki
    entries.map(&:export_anki).join('<br>')
  end
end
