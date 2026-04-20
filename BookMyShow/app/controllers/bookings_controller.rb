class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show update destroy ]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # POST /bookings
  # POST /bookings.json
  def create

    seat = Seat.where(id: params(:seat_ids) , show_id: params[:show_id])

    if seats.any? {|seat| seat.booked}
      render json: {message: 'some seats already booked'},status: :unprocessable_entity
      return
    end

    booking = Booking.create!(user_id: params[:user_id],
                              show_id: params[:show_id],
                              total_price: seat_count * 150
    )

    seats.each do |seat|
      seat.update!(booked: true)

      BookingSeat.create!(booking_id: booking.id,
                           seat_id: seat.id
      )
    end

    render json: booking , status: created
  end


  

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    if @booking.update(booking_params)
      render :show, status: :ok, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.fetch(:booking, {})
    end
end
