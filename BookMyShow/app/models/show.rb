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
    rows = ('A'..'J').to_a 
    numbers = (1..10).to_a

    rows.each do |row|
      numbers.each do |num|
        category = 
        if ['A','B','C'].include?(row)
          'silver'
        elsif['D','E','F'].include?(row)
          'gold'
        else 
          'platinum'
        end

        price = 
        case category
        when 'platinum'
          300
        when 'gold'
          250
        else
          150
        end
        
        Seat.create(seat_number: "#{row}#{num}",
                    show_id: self.id,
                    category: category,
                    price: price ,
                    booked: false
        )
      end
    end
    
  end

end

