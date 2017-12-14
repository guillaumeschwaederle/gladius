class ExercicesController < ApplicationController
  before_action :set_exercice, only: [ :edit, :update, :destroy]

  def index
   @exercices = Exercice.all
  end

  def new
    @exercice = Exercice.new
  end

  def create
    @exercice.category = 'Exercice personnel'
    @exercice = Exercice.new(exercice_params)  
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
    redirect_to exercices_path
  end

  private

  def set_exercice
    @exercice = Exercice.find(params[:id])
  end

  def exercice_params
    params.require(:exercice).permit(:name, :description)
  end
end
