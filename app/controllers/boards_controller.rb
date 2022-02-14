class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmation_workspace, only: [:new, :create]
  before_action :confirmation_board, only: [:show, :destroy]

  def index
  end

  def show
    @board = Board.includes(:task_lists, :tasks, :users).find(params[:id])
    @task_lists = @board.task_lists
    @users = @board.users
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to workspace_url(params[:workspace_id])
    else
      render :new
    end
  end

  def destroy
    board = Board.find(params[:id])
    if board.destroy
      redirect_to workspace_url(board.workspace_id)
    else
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:name).merge(workspace_id: params[:workspace_id])
  end

  def confirmation_board
    board = Board.find(params[:id])
    unless current_user.workspaces.include?(board.workspace)
      redirect_to root_url, alert: "そのボードは存在しません。"
    end
  end

  def confirmation_workspace
    workspace = Workspace.find(params[:workspace_id])
    unless current_user.workspaces.include?(workspace)
      redirect_to root_url, alert: "そのワークスペースは存在しません。"
    end
  end
end
