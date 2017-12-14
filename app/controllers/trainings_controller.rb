class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :destroy]

  def index
    @trainings = current_user.profile.trainings
  end


  def new
    @training = Training.new
    @serie = Serie.new
    @exercices = Exercice.all
    if params[:search] && params[:search] != ""
      @exercices = Exercice.search(params[:search])
    end
  end

  def create
    @training = Training.new(training_params)
    @training.profile = current_user.profile
    @arr_series = params.keys.each_with_object([]) { |key, a| a << params[key] if key.match(/serie\d+/) }
    if @training.save
      @arr_series.each do |serie|
        e = Exercice.find_by_name(serie[:exercice_name])
        s = Serie.create(goal: serie[:goal], exercice: e, training: @training)
      end
      redirect_to trainings_path
    else
      render :new
    end
  end

  def show
    @seances = @training.seances
    @seance = Seance.new
  end

  def destroy
    @training.destroy
    redirect_to trainings_path
  end

  private

  def set_training
    @training = Training.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:name)
  end
end
