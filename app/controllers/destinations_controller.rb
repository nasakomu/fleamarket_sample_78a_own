class DestinationsController < ApplicationController
  before_action :correct_user
  before_action :set_destination

  def edit
  end

  def update
    if @destination.update(destination_params)
      redirect_to users_show_path, notice: "情報を変更しました"
    else
      render :edit, alert: "エラーが発生しました"
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:first_name,:family_name,:first_name_kana,:family_name_kana,:postal_code,:prefecture_code,:city, :house_number,:room_number,:phone_number).merge(user_id: current_user.id)
  end

  def set_destination
    @destination = current_user.destination
  end

  def correct_user
    correct_user = Destination.find(params[:id]).user
    redirect_to(root_path) unless correct_user == current_user && user_signed_in?
  end
end