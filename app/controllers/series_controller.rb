class SeriesController < ApplicationController
  before_action :set_training
  before_action :set_serie

  def create
    @serie = Serie.new(serie_params)
    if @serie.save
      redirect_to trainings_path
    else
      render :new
    end
  end

  def update
    @serie.update(serie_params)
  end

  def destroy
    @serie.destroy
  end

  private

  def set_training
    @training = Training.find(params[:training_id])
  end

  def set_serie
    @serie = Serie.find(params[:id])
  end

  def serie_params
    params.require(:serie).permit(:goal, :done, :exercice_id, :training_id)
  end
end
