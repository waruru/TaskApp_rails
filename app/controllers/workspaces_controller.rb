class WorkspacesController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmation_workspace, only: [:show, :destroy]

  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.includes(:boards, :users).find(params[:id])
    @boards = @workspace.boards
    @users = @workspace.users
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      current_user.workspaces << @workspace
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    workspace = Workspace.find(params[:id])
    
    if workspace.destroy
      redirect_to root_url and return
    else
      render :show
    end
  end

  private
  def workspace_params
    params.require(:workspace).permit(:name, :color)
  end

  def confirmation_workspace
    workspace = Workspace.find(params[:id])
    unless current_user.workspaces.include?(workspace)
      redirect_to root_url, alert: "そのワークスペースは存在しません。"
    end
  end
end
