class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :workspace_users, dependent: :destroy
  has_many :workspaces, through: :workspace_users
  has_many :workspace_join_requests, class_name: "WorkspaceJoinRequest", foreign_key: "request_recipient_id", dependent: :destroy
  has_many :join_request_workspaces, through: :workspace_join_requests, source: :workspace
  has_many :board_users, dependent: :destroy
  has_many :boards, through: :board_users

  before_validation :set_display_name

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
    return User.where(id: users.map(&:id))
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = "password"  # Devise.friendly_token[0,20]
    end
  end

  private
  def set_display_name
    self.display_name = self.display_name.empty? ? self.unique_id : self.display_name
  end
end
