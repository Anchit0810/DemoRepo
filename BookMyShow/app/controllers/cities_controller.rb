class CitiesController < ApplicationController
    before_action :set_city , only: [:show, :update , :destroy]  

  def index
    @cities = City.all
    render 'index' , status: :ok
  end

  def show 
    render 'show' , status: :ok
  end

  def create 
    @city = City.new(cities_params)
    if City.exists?(city_name: @city.city_name.downcase, state: @city.state.downcase)
      render json: {errors: 'Already exists!'}
    elsif @city.save 
      render json: @city , status: :created
    else 
      render json: { message: @city.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if @city.update(cities_params)
      render json: @city , status: :ok
    else 
      render json: {message: @city.error.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @city.destroy
	 		render json: {message: 'cities delete succefully'} , status: :ok
		else 
			render json: {message: @city.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def cities_params
    params.permit(:city_name,:state )
  end

  def set_city
    @city  = City.find_by(id: params[:id])
    unless @city.present? 
      render json: {message: 'City not present'} , status: :not_found
    end
  end
end
