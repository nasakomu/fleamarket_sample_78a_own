class ProfilesController < ApplicationController
  def new
    @profile = profile.new
  end

  def create
    @profile = Profile.new(params)
  end
end
