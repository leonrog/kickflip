class Review < ApplicationRecord
  belongs_to :obstacle
  belongs_to :user
  validates :title, :description, :rating, presence: true
  validates :rating, numericality: { within: 0..5 }
end
