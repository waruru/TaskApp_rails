class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmation_task_list

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to task.board
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :memo).merge(task_list_id: params[:task_list_id])
  end

  def confirmation_task_list
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
