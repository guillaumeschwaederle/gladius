class SeriesController < ApplicationController
  before_action :set_serie

  def destroy
    @serie.destroy
  end

  private

  def set_serie
    @serie = Serie.find(params[:id])
  end
end
