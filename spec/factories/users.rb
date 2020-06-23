FactoryBot.define do
  factory :user do
    username { 'test_bot' }
    full_name { 'Factory Bot' }
    email { 'factory_bot@testing.com' }
  end

  factory :other_user, class: 'User' do
    username { "#{Faker::Name.first_name}_123" }
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
