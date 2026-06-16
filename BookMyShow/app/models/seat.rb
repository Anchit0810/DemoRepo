class Seat < ApplicationRecord
  belongs_to :show
  has_many :booking_seats
  has_many :bookings , through: :booking_seats

  validates :seat_number , presence: true


end
