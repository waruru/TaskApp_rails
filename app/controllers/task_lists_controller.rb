class TaskListsController < ApplicationController
  before_action :authenticate_user!

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
      redirect_to redirect_back(fallback_location: root_path)
    end
  end

  private
  def task_list_params
    params.require(:task_list).permit(:name).merge(board_id: params[:board_id])
  end
end
