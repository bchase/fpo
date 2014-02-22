FactoryGirl.define do
  # factory :entry do
  #   traditional_characters nil
  #   simplified_characters nil
  #   pronunciation nil
  #   glosses nil
  # end

  factory :meishuode, :class => Entry do
    traditional_characters '沒說的'
    simplified_characters '没说的'
    pronunciation 'mei2 shuo1 de5'
    glosses "really good"
  end

  factory :mei, :class => Entry do
    traditional_characters '沒'
    simplified_characters '没'
    pronunciation 'mei2'
    glosses "(negative prefix for verbs)\nhave not\nnot"
  end

  factory :mo, :class => Entry do
    traditional_characters '沒'
    simplified_characters '没'
    pronunciation 'mo4'
    glosses "drowned\nto end\nto die\nto inundate"
  end
end
