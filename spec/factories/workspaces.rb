FactoryBot.define do
  factory :workspace do
    sequence(:name) { |n| "ワークスペース#{n}" }
  end
end
