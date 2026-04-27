class BookingSeatsController < ApplicationController
  before_action :set_booking_seat, only: %i[ show update destroy ]

  def index
    @booking_seats = BookingSeat.all
  end

  def show
  end

  def create
    @booking_seat = BookingSeat.new(booking_seat_params)

    if @booking_seat.save
      render :show, status: :created, location: @booking_seat
    else
      render json: @booking_seat.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @booking_seat.update(booking_seat_params)
      render :show, status: :ok, location: @booking_seat
    else
      render json: @booking_seat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booking_seat.destroy!
  end

  private
    def set_booking_seat
      @booking_seat = BookingSeat.find(params.expect(:id))
    end

    def booking_seat_params
      params.fetch(:booking_seat, {})
    end
end
