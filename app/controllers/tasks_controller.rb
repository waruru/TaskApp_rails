class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmation_board, only: [:new, :create]

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task.board
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(update_params)
      redirect_to task_url(@task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to board_url(@task.board_id)
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :memo).merge(task_list_id: params[:task_list_id])
  end

  def update_params
    params.require(:task).permit(:title, :memo)
  end

  def confirmation_board
    task_list = TaskList.find(params[:task_list_id])
    unless current_user.boards.include?(task_list.board)
      if current_user.workspaces.include?(task_list.board.workspace)
        redirect_to task_list.board.workspace, alert: "ボードに参加していないため変更を行えません。" and return
      else
        redirect_to root_url, alert: "そのリストは存在しません。"
      end
    end
  end
end
