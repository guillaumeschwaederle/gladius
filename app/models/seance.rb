class Seance < ApplicationRecord
  belongs_to :training

  has_many :completions, dependent: :destroy
  has_many :series, through: :completions

  validates :date, presence: true

  def percent
    sum_goal = 0
    sum_done = 0
    if self.completions.empty?
      0
    else
      self.completions.each do |completion|
        sum_goal += completion.serie.goal
        sum_done += completion.done
      end
      sum_done / sum_goal.to_f
    end
  end

  def completion_filled?
    self.completions.each do |completion|
      completion.done
    end
  end
end
