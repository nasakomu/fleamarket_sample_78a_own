# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def show
    @user = User.find(current_user.id)
    @items = @user.items.where(status_id: 1)
  end
  
  def putting_up_list
    @user = User.find(current_user.id)
    @items = @user.items.where(status_id: 1)

  end

  def completed_item
    @user = User.find(current_user.id)
    @items = @user.items.where(status_id: 2)

  end

  def edit_info
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  def destination
    @user = User.find(current_user.id)
  end

  def payment_method
    @user = User.find(current_user.id)
  end

  def logout
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
