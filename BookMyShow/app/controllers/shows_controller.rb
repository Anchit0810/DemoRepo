class ShowsController < ApplicationController

 before_action :set_show , except: [:create, :index]  

  def index
    @shows = Show.all
    
    if params[:id].present?
      @shows = Show.where(id: params[:id])
    end

    if params[:theater_id].present? 
      @shows = Show.where(theater_id: params[:theater_id])
    end

    if params[:theater_name].present?
      @shows = Show.joins(:theater).where(theaters: {theater_name: params[:theater_name].downcase})
    end 
    render json: @shows  , status: :ok
  end

  def show 
    render json: @shows , status: :ok
  end

  def create
    @show = Show.new(shows_params)
    if @show.save 
      render json: @show , status: :created
    else 
      puts @show.errors.full_messages
      render json: { message: @show.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if @show.update(shows_params)
      render json: @show , status: :ok
    else 
      render json: {message: @show.errors.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @show.destroy
	 		render json: {message: 'show deleted succefully'} , status: :ok
		else 
			render json: {message: @show.errors.full_messages} , status: :unprocessable_entity	
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
