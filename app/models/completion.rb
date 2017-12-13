class Completion < ApplicationRecord
  belongs_to :serie
  belongs_to :seance

  validates :done, presence: true

  def percent
    done / self.serie.goal.to_f
  end
end

