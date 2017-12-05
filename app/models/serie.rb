class Serie < ApplicationRecord
  belongs_to :exercice
  belongs_to :training

  validates :goal, presence: true
end
