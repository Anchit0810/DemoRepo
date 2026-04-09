class ShowsController < ApplicationController

before_action :set_show , except: [:create, :index]  

  def index
    @shows = Show.all
    render json: @shows , status: :ok
  end

  def show 
    render json: @shows , status: :ok
  end

  def create
    @shows = Show.new(shows_params)
    if @shows.save 
      render json: @shows , status: :created
    else 
      puts @shows.errors.full_messages
      render json: { message: @shows.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if @shows.update(shows_params)
      render json: @shows , status: :ok
    else 
      render json: {message: @shows.errors.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @shows.destroy
	 		render json: {message: 'show deleted succefully'} , status: :ok
		else 
			render json: {message: @shows.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def shows_params
    params.permit(:show_time , :movie_id , :theater_id ) 
  end

  def set_show
    @shows = Show.find_by(id: params[:id])
    unless @shows.present? 
      render json: {message: 'Show not present'} , status: :not_found
      return
    end
  end


end
