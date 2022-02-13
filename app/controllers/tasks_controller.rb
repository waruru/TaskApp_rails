class TasksController < ApplicationController
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
end
