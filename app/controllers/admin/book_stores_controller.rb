class Admin::BookStoresController < ApplicationController
  def index
  end

  def show
  end

  def unsubscribe
  end
  
  private

  def book_store_params
    params.require(:book_store).permit(:name, :image, :body)
  end
end
