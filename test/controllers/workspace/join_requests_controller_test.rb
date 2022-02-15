require "test_helper"

class Workspace::JoinRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workspace_join_requests_index_url
    assert_response :success
  end
end
