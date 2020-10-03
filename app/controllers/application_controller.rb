class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:nickname,:email,:encrypted_password, profile_attributes:[:first_name,:family_name, :first_name_kana,:family_name_kana,:birth_date],destination_attributes:[:first_name,:family_name,:first_name_kana,:family_name_kana,:postal_code,:prefecture_code,:city, :house_number,:room_number,:phone_number]])
  end
end