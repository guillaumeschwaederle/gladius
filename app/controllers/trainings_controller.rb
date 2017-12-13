class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  def index
    @trainings = Training.all
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
  end

  def edit
    @token = session[:_csrf_token]
    gon.token = @token
    @serie = Serie.new
    @series = @training.series
    gon.series = @series
    @exercices = Exercice.all
    gon.exercices = @exercices
    if params[:search] && params[:search] != ""
      @exercices = Exercice.search(params[:search])
    end
  end

  def update
    @training.update(training_params) if params[:training]
    @arr_series = params.keys.each_with_object([]) { |key, a| a << params[key] if key.match(/serie\d+/) }
    @arr_series.each do |serie|
      s = Serie.find(serie[:id])
      s.done = serie[:done]
      s.save
    end
    @arr_seriesnew = params.keys.each_with_object([]) { |key, a| a << params[key] if key.match(/serienew\d+/) }
    @arr_seriesnew.each do |serie|
      e = Exercice.find_by_name(serie[:exercice_name])
      s = Serie.create(goal: serie[:goal], exercice: e, training: @training)
    end
    @arr_seriesreal = params.keys.each_with_object([]) { |key, a| a << params[key] if key.match(/seriereal\d+/) }
      @arr_seriesreal.each do |serie|
      s = Serie.find(serie[:id]) if Serie.exists?(id: serie[:id])
      s.goal = serie[:goal] if s
      s.save if s
    end
    redirect_to trainings_path
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
