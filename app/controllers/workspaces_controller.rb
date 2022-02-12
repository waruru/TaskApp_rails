class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.includes(:boards, :users).find(params[:id])
    unless current_user.workspaces.include?(@workspace)
      redirect_to root_path
    end

    @boards = @workspace.boards
    @users = @workspace.users
  end

  def new
    @workspace = Workspace.new
  end

  def create
    workspace = Workspace.new(workspace_params)
    if workspace.save
      current_user.workspaces << workspace
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    workspace = Workspace.find(params[:id])
    if workspace.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def workspace_params
    params.require(:workspace).permit(:name)
  end
end
