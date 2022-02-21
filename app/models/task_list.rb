class TaskList < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy
end
