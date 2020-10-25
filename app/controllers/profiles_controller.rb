class ProfilesController < ApplicationController
  before_action :correct_user
  before_action :set_profile

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to users_show_path, notice: "情報を変更しました"
    else
      render :edit, alert: "エラーが発生しました"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name,:family_name, :first_name_kana,:family_name_kana,:birth_date).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = current_user.profile
  end

  def correct_user
    correct_user = Profile.find(params[:id]).user
    redirect_to(root_path) unless correct_user == current_user && user_signed_in?
  end
end
