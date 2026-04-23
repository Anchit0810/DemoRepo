class Show < ApplicationRecord
 belongs_to :movie
 belongs_to :theater

 has_many :bookings 
 

 has_many :seats , dependent: :destroy 

 after_create :generate_seats

 validates :show_time, presence: true
 
 #  validate :show_time_format

 private
   
  def generate_seats
    rows = ['A', 'B' , 'C' , 'D' , 'E' ]

    rows.each do |row|
      (1..10).each do |number|
        seats.create(seat_number: "#{row}#{number}")
      end
    end
  end

end

