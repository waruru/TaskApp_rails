class BoardUsersController < ApplicationController
  def create
    board_user = current_user.board_users.new(board_id: params[:board_id])
    if board_user.save
      redirect_to board_user.board
    else
      redirect_to redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    board_user = BoardUser.find_by(board_id: params[:board_id], user: current_user)
    if board_user.destroy
      redirect_to board_user.board
    else
      redirect_to redirect_back(fallback_location: root_path)
    end
  end
end