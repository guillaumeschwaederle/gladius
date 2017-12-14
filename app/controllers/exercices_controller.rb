class ExercicesController < ApplicationController
  before_action :set_exercice, only: [ :edit, :update, :destroy]

  def index
   @exercices = current_user.profile.exercices + Profile.first.exercices
  end

  def new
    @exercice = Exercice.new
  end

  def create
    @exercice = Exercice.new(exercice_params)
    @exercice.category = 'Exercice personnel'
    @exercice.profile = current_user.profile
    if @exercice.save
      redirect_to exercices_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @exercice.destroy
  end

  private

  def set_exercice
    @exercice = Exercice.find(params[:id])
  end

  def exercice_params
    params.require(:exercice).permit(:name, :description)
  end
end
