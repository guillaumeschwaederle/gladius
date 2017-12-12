class Training < ApplicationRecord
  belongs_to :profile

  has_many :series, class_name: "Serie", dependent: :destroy
  has_many :exercices, through: :series
  has_many :seances
  has_many :completions, through: :seances

  validates :name, presence: true
end
