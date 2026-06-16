class Movie < ApplicationRecord
  
  has_many :shows
  has_many :theaters, through: :shows 

  before_validation :downcase_movie_language_genre

  VALID_GENRES = [ 'action', 'comedy', 'romantic', 'thriller', 'drama', 'horror', 'sci-fi', 'documentary', 'family', 'fantasy', 'biopic', 'animated' ]
  VALID_CATEGORY = [ 'U/A 7+', 'U/A 12+', 'U/A 16+', 'A' ]
  VALID_LANGUAGE = [ 'hindi', 'english', 'tamil', 'telugu', 'marathi' ]


  validates :movie_name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/ , message: 'only letters and spaces allowed'}

  validates :movie_genre, presence: true, inclusion: { in: VALID_GENRES, message: 'Not a valid Genre' }

  validates :imdb_rating, presence: true, format: { with: /\A\d.\d\z/ , message: 'fromat 8.8 ' }

  validates :movie_category, presence: true, inclusion: { in: VALID_CATEGORY, message: 'Not a valid category' }

  validates :duration, presence: true, format: { with: /\A[0]{1}[1-5]:[0-60]{2}:[0-60]{2}\z/ }

  validates :language, presence: true, inclusion: { in: VALID_LANGUAGE, message: 'Not a valid language category'  }

end

  def downcase_movie_language_genre
    self.movie_genre = movie_genre.downcase.strip
    self.language = language.downcase.strip
  end 

