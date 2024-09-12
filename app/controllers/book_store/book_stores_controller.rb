class BookStore::BookStoresController < ApplicationController
  before_action :authenticate_book_store!

  def edit
    @book_store = current_book_store
  end

  def show
    @book_store = current_book_store
    @posts = @book_store.posts.page(params[:page]).per(5)
  end

  def update
    @book_store = BookStore.find(params[:id])
    if @book_store.update(book_store_params)
       @book_store.save_tags(params[:book_store][:tag])
       flash[:notice] = "success"
       redirect_to book_store_book_store_path(@book_store)
    else
       flash.now[:alert] = "failer"
       render "book_store/book_stores/edit"
    end
  end

  def unsubscribe
  end

  def withdraw
    current_book_store.update(is_active: false)
    reset_session
    redirect_to new_book_store_registration_path
  end

  private

  def book_store_params
    params.require(:book_store).permit(:name,
                                     :age,
                                     :address,
                                     :telephone_number,
                                     :image,
                                     :email,
                                     )
  end
end
