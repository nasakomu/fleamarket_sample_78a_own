# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  


  def new
    @user = User.new
    @user.build_destination
    @user.build_profile
    
  end

  def create
    super
    @user = User.new(configure_sign_up_params)
    @user.save
    redirect_to root_path
  end

  
  # private
  

  # def user_params
  #   params.require(:user).permit(:nickname,:email,:encrypted_password, profile_attributes:[:first_name,:family_name, :first_name_kana,:family_name_kana,:birth_date])
  # end
  # protected

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
