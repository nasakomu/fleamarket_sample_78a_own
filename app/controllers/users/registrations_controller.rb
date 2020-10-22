# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_current_user, only: [:update, :edit]
  # before_action :configure_account_update_params, only: [:update], if: :devise_controller?

  def new
    @user = User.new
    @user.build_destination
    @user.build_profile
    
  end

  def create
    super
    @user = User.new(configure_sign_up_params)
    @user.save
  end

  # def update
  #   binding.pry
  #   if @user.update(configure_account_update_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  private
  
  def set_current_user
    @user = User.find(current_user.id)
  end
  
  protected
  
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update,keys: [:nickname,:email,:encrypted_password, profile_attributes:[:first_name,:family_name, :first_name_kana,:family_name_kana,:birth_date],destination_attributes:[:first_name,:family_name,:first_name_kana,:family_name_kana,:postal_code,:prefecture_code,:city, :house_number,:room_number,:phone_number]])
  # end
  # def after_sign_up_path_for(resource)
  #   # サインアップ後のリダイレクト先をrootに変更
  #   new_destination_path
  # end

  # def after_update_path_for(resource)
  #   user_path(current_user)
  # end

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

end
