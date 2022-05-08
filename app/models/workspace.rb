class Workspace < ApplicationRecord
  has_many :workspace_users, dependent: :destroy
  has_many :users, through: :workspace_users
  has_many :join_requests, class_name: "WorkspaceJoinRequest", dependent: :destroy
  has_many :join_request_senders, through: :join_requests, source: :sender
  has_many :join_request_recipients, through: :join_requests, source: :recipient
  has_many :boards, dependent: :destroy
  
  validates :name, presence: true
  validate :color, presence: true
end
