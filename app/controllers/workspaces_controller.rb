class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = Workspace.all
  end

  def show
    @workspace = Workspace.find(params[:id])
  end

  def new
  end

  def create
  end
end
