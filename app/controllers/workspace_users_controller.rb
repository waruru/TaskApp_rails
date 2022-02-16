class WorkspaceUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmation_workspace, only: [:new, :create, :destroy]

  def create
    user = User.find(params[:user])
    workspace = Workspace.find(params[:workspace_id])
    if workspace.users.include?(user)
      flash[:alert] = "そのユーザーはすでに所属しています。"
      render :new
    else
      workspace_user = WorkspaceUser.new(user: user, workspace: workspace)
      if workspace_user.save
        redirect_to workspace, notice: "#{user.unique_id} を招待しました。"
      else
        flash[:alert] = "招待に失敗しました。"
        render :new
      end
    end
  end

  def destroy
    workspace_user = WorkspaceUser.find_by(workspace_id: params[:workspace_id], user_id: params[:user])
    if workspace_user.destroy
      redirect_to workspace_user.workspace and return
    else
      redirect_back fallback_location: root_url and return
    end
  end

  private
  def confirmation_workspace
    workspace = Workspace.find(params[:workspace_id])
    unless current_user.workspaces.include?(workspace)
      redirect_to root_url, alert: "そのワークスペースは存在しません。"
    end
  end
end
