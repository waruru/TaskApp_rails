class User::TopController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = current_user.workspaces
    @boards = current_user.boards
  end
end
