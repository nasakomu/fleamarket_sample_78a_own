class ProfilesController < ApplicationController
  before_action :set_current_user, only: [:edit, :update]

  def edit
  end

  def update
  end

  private
  def set_current_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:item).permit(:first_name,:family_name, :first_name_kana,:family_name_kana,:birth_date).merge(user_id: current_user.id)
  end
end
