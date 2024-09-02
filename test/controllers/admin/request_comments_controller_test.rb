require "test_helper"

class Admin::RequestCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_request_comments_index_url
    assert_response :success
  end
end
