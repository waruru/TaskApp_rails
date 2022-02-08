require "test_helper"

class TaskListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get task_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get task_lists_new_url
    assert_response :success
  end
end
