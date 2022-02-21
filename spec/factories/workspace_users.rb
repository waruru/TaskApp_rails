FactoryBot.define do
  factory :workspace_user do
    association :user
    association :workspace
  end
end
