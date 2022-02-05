class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = current_user.workspaces
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
end
