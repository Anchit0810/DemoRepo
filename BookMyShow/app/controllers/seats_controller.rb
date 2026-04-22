class SeatsController < ApplicationController
  before_action :set_seat, only: %i[ update destroy ]

  def index
    @seats = Seat.all
    if params[:show_id]#.present?
      @seats = @seats.where(show_id: params[:show_id])
    end
    if params[:booked]#.present?
      @seats = @seats.where(booked: params[:booked])
    end  
    if params[:seat_number]#.present? 
      @seats = @seats.where(seat_number: params[:seat_number])
    end
     render json: @seats, status: :ok
  end
  
  def show
    # @seat = Seat.where(seats: {booked: params[:booked]})
    # render json: @seat
  end

  def create
    @seat = Seat.new(seat_params)

    if @seat.save
      render :show, status: :created, location: @seat
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  def update
    if @seat.update(seat_params)
      render :show, status: :ok, location: @seat
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @seat.destroy!
  end

  private
    def set_seat
      @seat = Seat.find(seat_params)
    end

    def seat_params
      params.require(:seat).permit(:id , :booked , :seat_number , :show_id  )
    end
end
