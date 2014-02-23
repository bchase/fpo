FactoryGirl.define do
  factory :card do
    front "MyText"
    back "MyText"
    deck nil
  end

  factory :card1 do
    front "MyText"
    back nil
    line_num 1
  end

  factory :card2 do
    front "MyText"
    back nil
    line_num 1
  end

  factory :card3 do
    front "MyText"
    back "Card #3 Note"
    line_num 2
  end
end
