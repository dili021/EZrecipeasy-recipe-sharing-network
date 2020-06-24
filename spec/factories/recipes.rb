FactoryBot.define do
  factory :recipe do
    association :author, factory: :other_user
    title { 'amazing dish' }
    description { 'description of a recipe' }
    ingredient_tags { 'broccoly, beef, potato' }
  end
end
