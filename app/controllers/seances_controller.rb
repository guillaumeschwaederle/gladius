class SeancesController < ApplicationController
  before_action :set_training, only: [:create]
  before_action :set_seance, only: [:show, :destroy]


  def index
    @seances = current_user.profile.seances
    @stat_trainings = trainings_completion
    @stat_seances = seances_completion
    @nb_seances = total_seances
    @percent_done = percent_done
    @total_done = total_done
    @total_seances_done = total_seances_done
    @percent_seances = (@total_seances_done / total_seances.to_f * 100).round(1)
    @average_serie_by_seance = average_serie_by_seance
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
  ################ private ###################

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def set_training
    @training = Training.find(params[:training_id])
  end

  def seance_params
    params.require(:seance).permit(:date)
  end

################### Stat #######################

  def trainings_completion
    arr = []
    current_user.profile.trainings.each do |training|
      arr << training.percent
    end
    if arr.count == 0
      a = 0
    else
      a = (arr.sum / arr.count * 100).round(1)
    end
    a
  end

  def seances_completion
    arr = []
    current_user.profile.trainings.each do |training|
      training.seances.each do |seance|
        arr << seance.percent
      end
    end
    if arr.count == 0
      a = 0
    else
      a = (arr.sum / arr.count * 100).round(1)
    end
    a
  end

  def total_seances_done
    sum = 0
    current_user.profile.trainings.each do |training|
      training.seances.each do |seance|
        sum += 1 unless seance.completions.empty?
      end
    end
    sum
  end

  def total_seances
    sum = 0
    current_user.profile.trainings.each do |training|
      sum += training.seances.count unless training.seances.empty?
    end
    sum
  end

  def total_done
    arr = []
    current_user.profile.trainings.each do |training|
      training.seances.each do |seance|
        seance.completions.each do |completion|
          arr << completion.done
        end
      end
    end
    arr.sum
  end

  def percent_done
    arr = []
    current_user.profile.trainings.each do |training|
      training.seances.each do |seance|
        seance.completions.each do |completion|
          arr << completion.done / completion.serie.goal.to_f * 100
        end
      end
    end
    if arr.count == 0
      a = 0
    else
      a = (arr.sum / arr.count.to_f).round(1)
    end
    a
  end

  def average_serie_by_seance
    arr = []
    current_user.profile.trainings.each do |training|
      training.seances.each do |seance|
        arr << seance.training.series.count
      end
    end
    if arr.count == 0
      a = 0
    else
      a = (arr.sum / arr.count.to_f).round(1)
    end
    a
  end
end
