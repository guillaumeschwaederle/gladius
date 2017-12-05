class Exercice < ApplicationRecord
    has_many :series
    validates :name, presence: true
end