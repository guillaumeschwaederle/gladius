class SeancesController < ApplicationController
  before_action :set_training, only: [:create]
  before_action :set_seance, only: [:show, :create, :destroy]


  def index
    @seances = Seance.all
    @stat_trainings = trainings_completion
    @stat_seances = seances_completion
    @nb_seances = total_seances
    @percent_done = percent_done
    @total_done = total_done
    @total_seances_done = total_seances_done
    @percent_seances = (total_seances_done / total_seances * 100).round(1)
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
    (arr.sum / arr.count * 100).round(1)
  end

  def seances_completion
    arr = []
    current_user.profile.trainings.each do |training|
      training.seances.each do |seance|
        arr << seance.percent
      end
    end
    (arr.sum / arr.count * 100).round(1)
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
      sum += training.seances.count
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
    (arr.sum / arr.count).round(1)
  end

  def favorite_training

  end
end
