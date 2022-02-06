require "test_helper"

class User::TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_top_index_url
    assert_response :success
  end
end
