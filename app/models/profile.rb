class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :trainings, dependent: :destroy
  has_many :seances, through: :trainings

  mount_uploader :photo, PhotoUploader
end
