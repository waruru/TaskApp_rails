class Workspace::JoinRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = current_user.workspace_join_requests
  end

  def new
    workspace = Workspace.includes(:join_requests, :join_request_recipients).find(params[:workspace_id])
    @join_requests = workspace.join_request

    if params[:search].present?
      @users = User.search_unique_id(params[:search].split)
    else
      @users = User.none
    end
  end

  def create
    user = User.find(params[:user])
    workspace = Workspace.includes(:join_request_recipients, :users).find(params[:workspace_id])
    if workspace.users.include?(user)
      redirect_to new_workspace_join_request_url(workspace), alert: "そのユーザーはすでに所属しています。"
    elsif workspace.join_request_recipients.include?(user)
      redirect_to new_workspace_join_request_url(workspace), alert: "そのユーザーはすでに招待済みです。"
    else
      join_request = WorkspaceJoinRequest.new(sender: current_user, recipient: user, workspace: workspace)
      if join_request.save
        redirect_to workspace, notice: "#{user.unique_id} を招待しました。"
      else
        redirect_to new_workspace_join_request_url(workspace), alert: "招待に失敗しました。"
      end
    end
  end

  def destroy
    join_request = WorkspaceJoinRequest.includes(:workspace).find(params[:id])

    if join_request.destroy
      redirect_to root_url, alert: "ワークスペースの招待を取り消しました。" and return
    else
      redirect_to join_request.workspace
    end
  end
end
