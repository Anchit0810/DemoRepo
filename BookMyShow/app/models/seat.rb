class Seat < ApplicationRecord
  belongs_to :show

  validates :seat_number , presence: true 
  validates :booked , presence: true 
end
