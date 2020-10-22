class ProfilesController < ApplicationController
  before_action :set_current_user, only: [:edit, :update]

  def edit
    @profile = @user.profile
  end

  def update
    @profile = @user.profile
    if @profile.update(profile_params)
      redirect_to users_show_path, notice: "情報を変更しました"
    else
      render :edit, alert: "エラーが発生しました"
    end
  end

  private
  def set_current_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:profile).permit(:first_name,:family_name, :first_name_kana,:family_name_kana,:birth_date).merge(user_id: current_user.id)
  end
end
