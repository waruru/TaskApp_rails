FactoryBot.define do
  factory :workspace_join_request do
    association :workspace
    association :request_sender, factory: :user
    association :request_recipient, factory: :user
  end
end
