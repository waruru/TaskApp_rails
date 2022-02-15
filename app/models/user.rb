class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workspace_users
  has_many :workspaces, through: :workspace_users
  has_many :workspace_join_requests, class_name: "WorkspaceJoinRequest", foreign_key: "request_recipient_id"
  has_many :board_users
  has_many :boards, through: :board_users

  validates :unique_id, presence: true, uniqueness: true, length: {minimum: Settings.user.minimum_unique_id_length, maximum: Settings.user.maximum_unique_id_length}, format: {with: /\A[\w]+\z/}

  # unique_id 前方一致検索
  def self.search_unique_id(keywords)
    users = User.none

    if keywords.instance_of?(Array)
      keywords.each do |keyword|
        users += User.where(["unique_id like(?)", "#{keyword}%"])
      end
    else
      users += User.where(["unique_id like(?)", "#{keywords}%"])
    end
    return users
  end 
end
