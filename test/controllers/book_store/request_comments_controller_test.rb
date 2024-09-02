require "test_helper"

class BookStore::RequestCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_store_request_comments_index_url
    assert_response :success
  end
end
