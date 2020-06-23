FactoryBot.define do
  factory :recipe do
    association :author, factory: :user
    title { 'amazing dish' }
    description { 'description of a recipe' }
    ingredient_tags { 'broccoly beef potato' }
  end
end
