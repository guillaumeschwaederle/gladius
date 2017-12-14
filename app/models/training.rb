class Training < ApplicationRecord
  belongs_to :profile

  has_many :series, class_name: "Serie", dependent: :destroy
  has_many :exercices, through: :series
  has_many :seances, dependent: :destroy
  has_many :completions, through: :seances, dependent: :destroy
  validates :name, presence: true

  def sum_reps
    sum = 0
    self.series.each do |serie|
        sum += serie.goal
      end
    sum
  end

  def percent
    sum_goal = self.sum_reps
    sum_done = 0
    self.seances.each do |seance|
      seance.completions.each do |completion|
        sum_done += completion.done
      end
    end
    sum_done / sum_goal.to_f
  end

  def exercice_count
    self.series
  end
end
