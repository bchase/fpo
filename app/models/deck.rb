class Deck < ActiveRecord::Base
  belongs_to :user

  has_one :text
  accepts_nested_attributes_for :text
end
