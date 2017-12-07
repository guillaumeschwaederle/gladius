class Exercice < ApplicationRecord
    has_many :series, class_name: "Serie"

    validates :name, presence: true
    validates :description, presence: true

end
