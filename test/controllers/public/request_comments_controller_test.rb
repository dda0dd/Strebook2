require "test_helper"

class Public::RequestCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_request_comments_new_url
    assert_response :success
  end
end
