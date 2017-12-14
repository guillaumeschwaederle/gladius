class SeancesController < ApplicationController
  before_action :set_training, only: [:create]
  before_action :set_seance, only: [:show, :create, :destroy]


  def index
    @seances = Seance.all
    @stat_trainings = trainings_completion
    @stat_seances = seances_completion
    @nb_seances = nb_seances
    @all_goal = all_goal
  end

  def show
    @completion = Completion.new
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

  def trainings_completion
    arr = []
    current_user.profile.trainings.each do |training|
      arr << training.percent
    end
    (arr.sum / arr.count * 100).round()
  end

  def seances_completion
    arr = []
    current_user.profile.trainings.each do |training|
      training.seances.each do |seance|
        arr << seance.percent
      end
    end
    (arr.sum / arr.count * 100).round()
  end

  def nb_seances
    sum = 0
    current_user.profile.trainings.each do |training|
      sum += training.seances.count
    end
    sum
  end

  def all_goal
    arr = []
    current_user.profile.trainings.each do |training|
      training.series.each do |serie|
        arr << serie.goal
      end
    end
    arr
  end
end
