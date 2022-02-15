class Workspace::JoinRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = current_user.workspace_join_requests
  end
end
