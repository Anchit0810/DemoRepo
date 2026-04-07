class MoviesController < ApplicationController

  before_action :set_movie , except: [:create, :index]  
  def index
    @movies = Movie.all
    render json: @movies
  end

  def show 
    render json: @movies
  end

  def create 
    @movies = Movie.new(movies_params)
    if @movies.save 
      render json: @movies 
    else 
      render json: { message: @movies.errors.full_messages }
    end
  end
 

  private 
  def movies_params
    params.permit(:movie_name,:movie_genre,:imdb_rating,:movie_category, :duration , :language )
  end

  def set_movie
    @movies = Movie.find_by(params[:movie_name])
    unless @movies.present? 
      render jason: {message: 'Movie not present'}
    end
  end

  
end
