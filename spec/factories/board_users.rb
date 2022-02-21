FactoryBot.define do
  factory :board_user do
    association :user
    association :board
  end
end
