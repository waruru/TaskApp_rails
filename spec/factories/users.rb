FactoryBot.define do
  factory :user do
    sequence(:unique_id) { |n| "tester#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
  end
end
