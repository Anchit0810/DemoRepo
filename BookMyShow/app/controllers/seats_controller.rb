class SeatsController < ApplicationController
  before_action :set_seat, only: %i[ update destroy ]

  # GET /seats
  # GET /seats.json
  def index
    # if params[:show_id].present?
    #   @seats = Seat.where(seats: {show_id: params[:show_id]})
    
    # else 
    #   puts "hello ji"
    #   @seats = Seat.all
    
    # end
    @seats = Seat.where(show_id: params[:show_id])
    if params[:booked].present?
      @seats = Seat.where(booked: params[:booked])
    end  
    if params[:seat_number].present? 
      @seats = Seat.where(seat_number: params[:seat_number])
    end
     render json: @seats, status: :ok
  end

  def find_seat_by_seat_number
    @seats = Seat.where(seats: {seat_number: params[:seat_number]})
    render json: @seats , status: :ok
  end 

  # GET /seats/1
  # GET /seats/1.json
  
  def show
    # @seat = Seat.where(seats: {booked: params[:booked]})
    # render json: @seat
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(seat_params)

    if @seat.save
      render :show, status: :created, location: @seat
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seats/1
  # PATCH/PUT /seats/1.json
  def update
    if @seat.update(seat_params)
      render :show, status: :ok, location: @seat
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seat
      @seat = Seat.find(seat_params)
    end

    # Only allow a list of trusted parameters through.
    def seat_params
      params.require(:seat).permit(:id , :booked , :seat_number , :show_id  )
    end
end
