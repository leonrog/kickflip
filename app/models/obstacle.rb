class Obstacle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :category, :price, :availability, :location, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :category, inclusion: { in: %w(flatrail curb kicker quarter ramp handrail other) }
end
