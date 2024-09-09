class Public::BookStoresController < ApplicationController

  def index
    @book_stores = BookStore.all
    @book_store = current_book_store
  end

  def show
    @book_store = BookStore.find(params[:id])
    @book_store_posts = @book_store.posts.page(params[:page]).per(5)
  end
end
