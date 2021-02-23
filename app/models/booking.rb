class Booking < ApplicationRecord
  belongs_to :obstacle
  belongs_to :user
end
