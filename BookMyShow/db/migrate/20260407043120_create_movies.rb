class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.string :movie_genre
      t.string :imdb_rating
      t.string :movie_category
      t.interval :duration
      t.string :language

      t.timestamps
    end
  end
end
