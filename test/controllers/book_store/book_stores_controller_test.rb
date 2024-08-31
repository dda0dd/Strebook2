require "test_helper"

class BookStore::BookStoresControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get book_store_book_stores_edit_url
    assert_response :success
  end

  test "should get show" do
    get book_store_book_stores_show_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get book_store_book_stores_unsubscribe_url
    assert_response :success
  end
end
