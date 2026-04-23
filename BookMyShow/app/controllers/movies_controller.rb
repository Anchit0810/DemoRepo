class MoviesController < ApplicationController

  before_action :set_movie , except: [:create, :index]  

  def index
    @movie = Movie.all
    render 'index' , status: :ok
  end

  def show 
    render 'show' , status: :ok
  end

  def create 
    @movie = Movie.new(movies_params)
    if @movie.save 
      render json: @movie , status: :created
    else 
      render json: { message: @movie.errors.full_messages } , status: :unprocessable_entity
    end
  end

  def update 
    if @movie.update(movies_params)
      render json: @movie , status: :ok
    else 
      render json: {message: @movie.error.full_messages}, status: :unprocessable_entity
    end
  end

	def destroy
		if @movie.destroy
	 		render json: {message: 'movie delete successfully'} , status: :ok
		else 
			render json: {message: @movie.errors.full_messages} , status: :unprocessable_entity	
		end
	end
 

  private 

  def movies_params
    params.permit(:movie_name,:movie_genre,:imdb_rating,:movie_category, :duration , :language )
  end

  def set_movie
    @movie = Movie.find_by(id: params[:id])
    unless @movie.present? 
      render json: {message: 'Movie not present'} , status: :not_found
    end
  end

  
end
