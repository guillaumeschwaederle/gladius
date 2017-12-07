class Training < ApplicationRecord
  belongs_to :profile
  has_many :series, class_name: "Serie"
  has_many :exercices, through: :series
  validates :name, presence: true
end
