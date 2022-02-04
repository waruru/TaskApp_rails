class Board < ApplicationRecord
  belongs_to :workspace
  has_many :task_lists
end
