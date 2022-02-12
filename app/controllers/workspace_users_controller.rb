class WorkspaceUsersController < ApplicationController
  def new
    if params[:search].present?
      @users = User.search_unique_id(params[:search].split)
    end
  end

  def create

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
