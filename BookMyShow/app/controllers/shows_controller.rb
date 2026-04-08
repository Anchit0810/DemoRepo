class ShowsController < ApplicationController

before_action :set_show , except: [:create, :index]  

  def index
    @show = Show.all
    render json: @show , status: :ok
  end

  def show 
    render json: @show , status: :ok
  end

  def create 
    @show = Show.new(shows_params)
    if @show.save 
      render json: @show , status: :created
    else 
      render json: { message: @show.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if @show.update(show_params)
      render json: @show , status: :ok
    else 
      render json: {message: @show.errors.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @show.destroy
	 		render json: {message: 'show delete succefully'} , status: :ok
		else 
			render json: {message: @show.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def shows_params
    params.permit(:show_time,:movie_id,:theater_id)
  end

  def set_show
    @show = show.find_by(id: params[:id])
    unless @show.present? 
      render json: {message: 'Show not present'} , status: :not_found
    end
  end


end
