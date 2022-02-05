class Task < ApplicationRecord
  belongs_to :task_list
  has_one :board, through: :task_list
end
