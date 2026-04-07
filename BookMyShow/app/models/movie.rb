class Movie < ApplicationRecord
  
  # has_many :Theater
  # belongs_to :Theater 

  VALID_GENRES = [ "Action", "Comedy", "Romantic", "Thriller", "Drama", "Horror", "Sci-fi", "Documentary", "Family", "Fantasy", "Biopic" ]
  VALID_CATEGORY = [ "U/A 7+", "U/A 13+", "U/A 16+", "A" ]
  VALID_LANGUAGE = [ "Hindi", "English", "Tamil", "Telugu" ]


  validates :movie_name, presence: true, format: { with: /\A[a-zA-Z]+\z/ }

  validates :movie_genre, presence: true, inclusion: { in: VALID_GENRES, message: "Not a valid Genre" }

  validates :imdb_rating, presence: true, format: { with: /\A[0-9]{1}.[0-9]{1}\z/ }

  validates :movie_category, presence: true, inclusion: { in: VALID_CATEGORY, message: "Not a valid category" }

  validates :duration, presence: true, format: { with: /\A[0]{1}[1-5]:[0-60]{2}:[0-60]{2}\z/ }

  validates :language, presence: true, inclusion: { in: VALID_LANGUAGE, message: "Not a valid language category"  }


  private 
  def duration_conversion
 
  end


end
