class Entry < ActiveRecord::Base
  include Zhdict::Word
  def trad; traditional_characters; end
  def simp; simplified_characters; end
  def pron; pronunciation; end
end
