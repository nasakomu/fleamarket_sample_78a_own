# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :set_current_user

  def show
    @items = @user.items.where(status_id: 1)
  end
  
  def putting_up_list
    @items = @user.items.where(status_id: 1)
  end

  def completed_item
    @items = @user.items.where(status_id: 2)
  end

  def edit
  end

  def payment_method
  end

  def logout
  end

  private
  def set_current_user
    @user = User.find(current_user.id)
  end

  def user_params
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:nickname,:email,:encrypted_password])
  end
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
