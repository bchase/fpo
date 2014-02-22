# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    front "MyText"
    back "MyText"
    deck nil
  end
end
