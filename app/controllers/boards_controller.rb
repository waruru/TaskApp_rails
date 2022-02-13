class BoardsController < ApplicationController
  before_action :authenticate_user!

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
      redirect_to workspace_path(params[:workspace_id])
    else
      render :new
    end
  end

  def destroy
    board = Board.find(params[:id])
    if board.destroy
      redirect_to workspace_path(board.workspace_id)
    else
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:name).merge(workspace_id: params[:workspace_id])
  end
end
