FactoryGirl.define do
  factory :text do
    name "山丘"
    artist "Jonathan Lee (李宗盛)"
    # episode "MyString"
    raw File.open('spec/texts/shanqiu.txt').readlines.join
  end
end
