class BoardUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmation_workspace

  def create
    board_user = current_user.board_users.new(board_id: params[:board_id])
    if board_user.save
      redirect_to board_user.board
    else
      redirect_back fallback_location: root_url
    end
  end

  def destroy
    board_user = BoardUser.find_by(board_id: params[:board_id], user: current_user)
    if board_user.destroy
      redirect_to board_user.board
    else
      redirect_back fallback_location: root_url
    end
  end

  private
  def confirmation_workspace
    board = Board.find(params[:board_id])
    unless current_user.workspaces.include?(board.workspace)
      redirect_to root_url, alert: "そのワークスペースは存在しません。"
    end
  end
end
