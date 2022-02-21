FactoryBot.define do
  factory :task_list do
    sequence(:name) { |n| "TaskList#{n}" }
    association :board
  end
end
