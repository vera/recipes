FactoryGirl.define do
  factory :recipe do
    sequence(:name){|n| "Recipe#{n}" }
    association :category
    ingredients { [ FactoryGirl.create(:ingredient) ] }
  end
end
