class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_customer, only: [:edit]

  def edit
    @customer = current_customer
  end

  def show
    @customer = current_customer
    @request_comments = @customer.request_comments.page(params[:page]).per(5)
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "success"
      redirect_to public_customer_path(params[:id])
    else
      flash.now[:alert] = "failer"
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_active: false)
    reset_session
    redirect_to new_customer_registration_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name,
                                     :age,
                                     :address,
                                     :occupation,
                                     :email
                                     )
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.guest?
      redirect_to customer_path(current_customer) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
