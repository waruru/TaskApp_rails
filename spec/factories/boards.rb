FactoryBot.define do
  factory :board do
    sequence(:name) { |n| "ボード#{n}" }
    association :workspace
  end
end
