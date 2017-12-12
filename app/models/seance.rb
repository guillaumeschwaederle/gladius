class Seance < ApplicationRecord
  belongs_to :training

  has_many :completions, dependent: :destroy
  has_many :series, through: :completions

  validates :date, presence: true
end
