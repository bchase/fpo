FactoryGirl.define do
  factory :deck do
    user nil
  end
end

FactoryGirl.define do
  factory :deck_with_text_and_user, :class => Deck do
    user create(:user)
    text create(:text)
  end
end
