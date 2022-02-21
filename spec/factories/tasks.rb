FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "タスク#{n}" }
    memo             { "タスクの説明文" }
    association :task_list
  end
end
