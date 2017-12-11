class TrainingsController < ApplicationController
  before_action :set_training, only: [:edit, :update]

  def index
    @trainings = Training.all
    @series_training = Serie.all.group_by { |s| s.training.id }
    gon.trainings = @trainings
    @exercices = Exercice.all
    gon.series_training = @series_training
    gon.series_exercice = @series_exercice
    gon.exercices = @exercices
    @ratio_total = ratio(@trainings).round(2)
    @completion_total = completion(@trainings).round(2)
    @total = number(@trainings)
    @token = session[:_csrf_token]
    gon.token = @token
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

  def edit

  end

  def update
    @arr_series = params.keys.each_with_object([]) { |key, a| a << params[key] if key.match(/serie\d+/) }
    @arr_series.each do |serie|
      s = Serie.find(serie[:id])
      s.done = serie[:done]
      s.save
    end
    redirect_to trainings_path
  end

  private

  def set_training
    @training = Training.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:name)
  end

  def completion(arr)
    average_arr = []
    arr.select { |a| a.completion > 0 }.each do |training|
      average_arr << training.completion
    end
    unless average_arr == []
      average_arr.sum / average_arr.size
    else
      0
    end
  end

  def ratio(arr)
    arr.select { |a| a.completion > 0 }.size / arr.size.to_f * 100
  end

  def number(arr)
    done = 0
    goal = 0
    arr.select { |a| a.completion > 0 }.each do |training|
      training.series.each do |serie|
          done += serie.done if serie.done
          goal += serie.goal
      end
    end
    {done: done, goal: goal}
  end
end
