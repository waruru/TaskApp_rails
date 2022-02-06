class Board < ApplicationRecord
  belongs_to :workspace
  has_many :task_lists
  has_many :tasks, through: :task_lists
  has_many :board_users
  has_many :users, through: :board_users
end
