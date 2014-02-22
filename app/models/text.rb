class Text < ActiveRecord::Base
  belongs_to :deck

  def raw_arr
    raw.split("\n")
  end
end
