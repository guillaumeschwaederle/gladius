class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :trainings, dependent: :destroy
  
  
end
