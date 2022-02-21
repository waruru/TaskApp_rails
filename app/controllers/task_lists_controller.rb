class TaskListsController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmation_board

  def new
    @task_list = TaskList.new
  end

  def create
    task_list = TaskList.new(task_list_params)
    if task_list.save
      redirect_to task_list.board
    else
      render :new
    end
  end

  def destroy
    task_list = TaskList.find(params[:id])
    if task_list.destroy
      redirect_to task_list.board
    else
      redirect_back fallback_location: root_url
    end
  end

  private
  def task_list_params
    params.require(:task_list).permit(:name).merge(board_id: params[:board_id])
  end

  def confirmation_board
    if params[:board_id].present?
      board = Board.find(params[:board_id])
    elsif params[:id].present?
      task_list = TaskList.find(params[:id])
      board = task_list.board
    else
      redirect_to root_url, alert: "エラーが発生しました。" and return
    end

    unless current_user.boards.include?(board)
      if current_user.workspaces.include?(board.workspace)
        redirect_to board.workspace, alert: "ボードに参加していないため変更を行えません。" and return
      else
        redirect_to root_url, alert: "そのボードは存在しません。" and return
      end
    end
  end
end
