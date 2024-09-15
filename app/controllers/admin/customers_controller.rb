class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    @book_store = Book_store.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました。"
    else
      render :edit
    end
    @book_store = Book_store.find(params[:id])
    if @book_store.update(book_store_params)
      redirect_to admin_book_store_path(@book_store), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    customer = Customer.find(params[:id])
    customer.update(is_active: false)
    redirect_to admin_customers_path
  end

  def search
    @word = params[:is_active]
    if @word.present?
      @customers = Customer.where(is_active: @word).page(params[:page]).per(5)
    else
      @customers = Customer.all.page(params[:page]).per(5)
    end
    render "admin/customers/index"
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :age, :address, :occupation, :is_active)
  end

  def book_store_params
    params.require(:book_store).permit(:name, :age, :address, :telephone_number, :is_active)
  end
end
