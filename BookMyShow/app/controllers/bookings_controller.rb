class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show update destroy ]

  def index
    @bookings = Booking.all
  end
  def show   
  end
 
  def create

    # ActiveRecord::Base.transaction do

    seats = Seat.where(id: params[:seat_ids] , show_id: params[:show_id])

    if seats.any? {|seat| seat.booked}
      render json: {message: 'some seats already booked'},status: :unprocessable_entity
      return
    end

    total_price = seats.count * 150

    @booking = Booking.create!(user_id: booking_params[:user_id],
                              show_id: booking_params[:show_id],
                              total_price: total_price
    )
    seats.each do |seat|
      seat.update!(booked: true)

      BookingSeat.create!(booking_id: booking.id,
                           seat_id: seat.id
      )
    end

    render json: booking , status: :created
  end

  def update
    if @booking.update(booking_params)
      render :show, status: :ok, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    
    ActiveRecord::Base.transaction do
      @booking.seat.each do |seat|
        seat.update!(booked: false)
      end 
      @booking.destroy
    end
    render json: {message: " booking cancelled"} , status: :ok
  end

  private  
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.permit(:user_id , :show_id , seat_ids:[])
    end
end
