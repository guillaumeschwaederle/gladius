class Training < ApplicationRecord
  belongs_to :profile
  has_many :series
  has_many :exercices, through: :series
  validates :last_name
end
