class CitiesController < ApplicationController
    before_action :set_city , except: [:create, :index]  

  def index
    @cities = City.all
    render json: @cities , status: :ok
  end

  def show 
    render json: @cities , status: :ok
  end

  def create 
    @cities = City.new(cities_params)
    if @cities.save 
      render json: @cities , status: :created
    else 
      render json: { message: @cities.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if @cities.update(cities_params)
      render json: @cities , status: :ok
    else 
      render json: {message: @cities.error.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @cities.destroy
	 		render json: {message: 'cities delete succefully'} , status: :ok
		else 
			render json: {message: @cities.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def cities_params
    params.permit(:city_name,:state )
  end

  def set_city
    @cities  = City.find_by(id: params[:id])
    unless @cities.present? 
      render json: {message: 'City not present'} , status: :not_found
    end
  end
end
