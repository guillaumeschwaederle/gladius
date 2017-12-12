class SeancesController < ApplicationController
  before_action :set_training, only: [:show, :create, :destroy]
  before_action :set_seance, only: [:show, :create, :destroy]

  def index
    @seances = Seance.all
  end

  def show
  end

  def create
  end

  def destroy
    @seance.destroy
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def set_training
    @training = Training.find(params[:training_id])
  end
end
