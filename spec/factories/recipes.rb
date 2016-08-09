FactoryGirl.define do
  factory :recipe do
    name "Testrezept"
    association :category
  end
end
