class TaskList < ApplicationRecord
  belongs_to :board
  has_many :tasks
end
