class ProfilesController < ApplicationController
  skip_before_action :profile_present?, only: [:new, :create]
  before_action :set_profile, only: [:show, :edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
  params.require(:profile).permit(:first_name, :last_name, :user_id, :height, :weight, :ville, :specialite, :photo, :photo_cache)
  end
end
