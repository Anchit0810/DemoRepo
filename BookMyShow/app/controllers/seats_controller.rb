class SeatsController < ApplicationController
  before_action :set_seat, only: %i[ show update destroy ]

  # GET /seats
  # GET /seats.json
  def index
    if params[:show_id].present?
      @seats = Seat.where(seats: {show_id: params[:show_id]})
    
    else 
      puts "hello ji"
      @seats = Seat.all
    
    end
    render json:  @seats , status: :ok
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
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
      @seat = Seat.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def seat_params
      params.fetch(:seat, {})
    end
end
