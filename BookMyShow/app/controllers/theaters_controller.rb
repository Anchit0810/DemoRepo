class TheatersController < ApplicationController

  before_action :set_theater , except: [:create, :index]  

  def index 
    if params[:city_name].present?

      @theaters = Theater.joins(:city).where(cities: {city_name: params[:city_name].downcase})
    
    else 
      puts "hello ji"
      @theaters = Theater.all
    
    end
    render  'index' , status: :ok

  end

  def show 
    render 'show' , status: :ok
  end

  def create 
    @theater = Theater.new(theater_params)
    if @theater.save 
      render json: @theater , status: :created
    else 
      render json: { message: @theater.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if params[:city_id].present?
      @theater.update(theater_params)
      render json: @theater , status: :ok
    else 
      render json: {message: @theater.errors.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @theater.destroy
	 		render json: {message: 'Theater deleted succefully'} , status: :ok
		else 
			render json: {message: @theater.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def theater_params
    params.permit(:city_id, :theater_name,:theater_location )
  end

  def set_theater
    @theater = Theater.find_by(id: params[:id])
    unless @theater.present? 
      render json: {message: 'Theater not present'} , status: :not_found
      return
    end
  end


end
