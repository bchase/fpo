class Deck < ActiveRecord::Base
  belongs_to :user

  has_one :text
  accepts_nested_attributes_for :text

  has_many :cards

  def export(format)
    format = format.to_s

    if format.match(/anki/)
      export_anki
    else
      ''
    end
  end

  def export_anki
    cards.map(&:export_anki).join
  end
end
