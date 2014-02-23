class Expression < ActiveRecord::Base
  belongs_to :card

  has_many :entries
end
