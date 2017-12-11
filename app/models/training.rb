class Training < ApplicationRecord
  belongs_to :profile
  has_many :series, class_name: "Serie", dependent: :destroy
  has_many :exercices, through: :series
  validates :name, presence: true

  def completion
    average_arr = []
    unless self.series.empty?
      self.series.each do |serie|
        average_arr << serie.completion
      end
    end
    unless average_arr == []
      average_arr.sum / average_arr.size * 100
    else
      0
    end
  end
end
