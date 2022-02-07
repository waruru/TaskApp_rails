class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.find(params[:id])
    unless current_user.workspaces.include?(@workspace)
      redirect_to redirect_back(fallback_location: root_path)
    end

    @boards = @workspace.boards
  end

  def new
  end

  def create
  end

  def destroy
    workspace = Workspace.find(params[:id])
    if workspace.destroy
      redirect_to root_path
    else
      render :show
    end
  end
end
