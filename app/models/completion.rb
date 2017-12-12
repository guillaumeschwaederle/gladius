class Completion < ApplicationRecord
  belongs_to :serie
  belongs_to :seance

  validates :done, presence: true
end
