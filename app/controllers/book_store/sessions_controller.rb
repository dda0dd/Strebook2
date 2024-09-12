class BookStore::SessionsController < Devise::SessionsController
  # frozen_string_literal: true
  before_action :book_store_status, only: [:create]
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

  def guest_sign_in
    book_store = BookStore.guest
    sign_in book_store
    redirect_to book_store_book_store_path(book_store.id), notice: "guestbook_storeでログインしました。"
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def book_store_status
    book_store = BookStore.find_by(name: params[:book_store][:name])
    return if book_store.nil?
    return unless book_store.valid_password?(params[:book_store][:password])
    if book_store.is_active == false
  	 redirect_to new_book_store_registration_path
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
end
