class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workspace_users
  has_many :workspaces, through: :workspace_users
  has_many :board_users
  has_many :boards, through: :board_users

  # unique_id 前方一致検索
  def self.search_unique_id(keywords)
    users = Array.new
    keywords.each do |keyword|
      users += User.where(["unique_id like(?)", "#{keyword}%"])
    end
    return users
  end 
end
