class SeancesController < ApplicationController
  before_action :set_training, only: [:create]
  before_action :set_seance, only: [:show, :destroy]


  def index
    @seances = Seance.all
  end

  def show
    @completion = Completion.new
  end

  def create
    @seance = Seance.new(seance_params)
    @seance.training = @training
    @seance.date = DateTime.parse(params[:seance][:date])
    if @seance.save
      redirect_to seances_path
    end
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

  def seance_params
    params.require(:seance).permit(:date)
  end
end
