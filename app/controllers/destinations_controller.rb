class DestinationsController < ApplicationController
  before_action :set_current_user, only: [:edit, :update]

  def edit
  end

  def update
  end

  private
  def set_current_user
    @user = User.find(current_user.id)
  end

  def destination_params
    params.require(:item).permit(:first_name,:family_name,:first_name_kana,:family_name_kana,:postal_code,:prefecture_code,:city, :house_number,:room_number,:phone_number).merge(user_id: current_user.id)
  end
end
