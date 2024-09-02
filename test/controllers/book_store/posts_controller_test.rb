require "test_helper"

class BookStore::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_store_posts_index_url
    assert_response :success
  end

  test "should get new" do
    get book_store_posts_new_url
    assert_response :success
  end
end
