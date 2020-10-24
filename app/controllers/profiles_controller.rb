class ProfilesController < ApplicationController

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
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
end
