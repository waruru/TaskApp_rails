class WorkspaceJoinRequest < ApplicationRecord
  belongs_to :workspace
  belongs_to :sender, class_name: "User", foreign_key: "request_sender_id"
  belongs_to :recipient, class_name: "User", foreign_key: "request_recipient_id"
end
