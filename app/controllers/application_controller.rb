class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_sign_up_params, if: :devise_controller?

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname,:email,:encrypted_password, profile_attributes:[:first_name,:family_name, :first_name_kana,:family_name_kana,:birth_date],destination_attributes:[:first_name,:family_name,:first_name_kana,:family_name_kana,:postal_code,:prefecture_code,:city, :house_number,:room_number,:phone_number]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:email,:encrypted_password])
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end
  
  def production?
    Rails.env.production?
  end
end