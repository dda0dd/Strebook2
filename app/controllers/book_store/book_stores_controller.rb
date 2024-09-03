class BookStore::BookStoresController < ApplicationController
  def edit
  end

  def show
  end

  def unsubscribe
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
