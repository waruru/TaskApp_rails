class TaskListsController < ApplicationController
  def show
  end

  def new
  end

  def destroy
  end

  private
  def task_list_params
    params.require(:task_list).permit()
  end
end
