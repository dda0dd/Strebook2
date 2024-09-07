class Public::SessionsController < Devise::SessionsController
  before_action :customer_status, only: [:create]
  # frozen_string_literal: true
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_in_path_for(resource)
	  root_path
  end

  def after_sign_out_path_for(resource)
	  root_path
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def customer_status
    customer = Customer.find_by(name: params[:customer][:name])
    return if customer.nil?
    return unless customer.valid_password?(params[:customer][:password])
    if customer.is_active == false
  	  redirect_to new_customer_registration_path
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
end
