class Serie < ApplicationRecord
  belongs_to :exercice
  belongs_to :training

  has_many :completions

  validates :goal, presence: true

  def completion
    if done.nil?
      0
    else
      done / goal.to_f
    end
  end
end

