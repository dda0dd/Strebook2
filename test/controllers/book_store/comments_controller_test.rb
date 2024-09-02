require "test_helper"

class BookStore::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_store_comments_index_url
    assert_response :success
  end
end
