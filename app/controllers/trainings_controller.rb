class TrainingsController < ApplicationController
  before_action :set_training, only: [:edit, :update]

  def index
    @trainings = Training.all
  end

  def new
    @training = Training.new
    @serie = Serie.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to trainings_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @training.update(training_params)
      redirect_to trainings_path
    else
      render :new
    end
  end

  private

  def set_training
    @training = Training.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:name, :profile_id)
  end

end
