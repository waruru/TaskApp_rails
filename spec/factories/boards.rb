FactoryBot.define do
  factory :board do
    sequence(:name) { |n| "γγΌγ#{n}" }
    association :workspace
  end
end
