require "test_helper"

class Admin::BookStoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_book_stores_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_book_stores_show_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get admin_book_stores_unsubscribe_url
    assert_response :success
  end
end
