class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show
  has_many :booking_seats
  has_many :seats , through: :booking_seats
end
