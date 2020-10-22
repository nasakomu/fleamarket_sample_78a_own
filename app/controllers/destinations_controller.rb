class DestinationsController < ApplicationController
  before_action :set_current_user, only: [:edit, :update]

  def edit
    @destination = @user.destination
  end

  def update
    @destination = @user.destination
    if @destination.update(destination_params)
      redirect_to users_show_path, notice: "情報を変更しました"
    else
      render :edit, alert: "エラーが発生しました"
    end
  end

  private
  def set_current_user
    @user = User.find(current_user.id)
  end

  def destination_params
    params.require(:destination).permit(:first_name,:family_name,:first_name_kana,:family_name_kana,:postal_code,:prefecture_code,:city, :house_number,:room_number,:phone_number).merge(user_id: current_user.id)
  end
end
