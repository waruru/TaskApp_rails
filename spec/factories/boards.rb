FactoryBot.define do
  factory :board do
    sequence(:name) { |n| "board#{n}" }
    association :workspace
  end
end
