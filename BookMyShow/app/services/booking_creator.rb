class BookingCreator
    def initialize(params , current_user)
        @params = params 
        @current_user = current_user
    end 
    
    def call

        ActiveRecord::Base.transaction do

      @seats = Seat.where(id: params[:seat_ids] , show_id: params[:show_id])

      if @seats.count != params[:seat_ids].length
        render json: {message: 'invalid seat selections'}, status: :unprocessable_entity
        return
      end

      if @seats.any? {|seat| seat.booked}
        render json: {message: 'some seats already booked'},status: :unprocessable_entity
        return
      end

      total_price = @seats.sum(:price)

      @booking = Booking.create!(user_id: booking_params[:user_id],
                                 show_id: booking_params[:show_id],
                                 total_price: total_price
      )

      @seats.each do |seat|
        seat.update!(booked: true)
        BookingSeat.create!(booking_id: @booking.id,seat_id: seat.id)
      end
 
    end
