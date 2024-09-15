class Admin::BookStoresController < ApplicationController
  def index
     @book_stores = BookStore.all.page(params[:page]).per(5)
  end

  def show
    @book_store = BookStore.find(params[:id])
    @book_store_new = BookStore.new
  end

  def edit
    @book_store = BookStore.find(params[:id])
    unless @book_store == current_book_store.id
      redirect_to book_stores_path
    end
  end

  def unsubscribe
    @book_store = BookStore.find(params[:id])
  end

  def withdraw
    book_store = BookStore.find(params[:id])
    book_store.update(is_active: false)
    redirect_to admin_book_stores_path
  end

  def search
    @word = params[:is_active]
    if @word.present?
      @book_stores = BookStore.where(is_active: @word).page(params[:page]).per(5)
    else
      @book_stores = BookStore.all.page(params[:page]).per(5)
    end
    render "admin/book_stores/index"
  end

  private

  def book_store_params
    params.require(:book_store).permit(:name, :image, :body)
  end

  private

  def book_store_params
    params.require(:book_store).permit(:name, :image, :body)
  end
end
