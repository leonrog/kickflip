class Obstacle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :category, :price, :availability, :location, presence: true
end
