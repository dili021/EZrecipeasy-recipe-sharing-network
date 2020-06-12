FactoryBot.define do
  factory :post do
    user
    body { 'Some sentence for testing' }
  end
end
