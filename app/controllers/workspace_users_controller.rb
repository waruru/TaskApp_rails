class WorkspaceUsersController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:search].present?
      @users = User.search_unique_id(params[:search].split)
    end
  end

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
      redirect_to redirect_back(fallback_location: root_path) and return
    end
  end
end
