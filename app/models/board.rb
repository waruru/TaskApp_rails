class Board < ApplicationRecord
  belongs_to :workspace
  has_many :task_lists, dependent: :destroy
  has_many :tasks, through: :task_lists
  has_many :board_users, dependent: :destroy
  has_many :users, through: :board_users
end
