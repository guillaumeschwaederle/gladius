class Exercice < ApplicationRecord
    has_many :series, class_name: "Serie", dependent: :destroy
    belongs_to :profile

    validates :name, presence: true
    validates :description, presence: true

  def self.search(search)
    all.where("name LIKE ?", "%#{search.capitalize}%")
  end
end
