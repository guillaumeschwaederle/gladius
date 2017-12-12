class SeancesController < ApplicationController
   before_action :set_seance, only: [:show, :delete]
   before_action :set_training, only: [:show]

  def index
  end

  def show
  end

  def create
  end

  def delete
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def set_training
    @training = Training.find(params[:training_id])
  end
end
