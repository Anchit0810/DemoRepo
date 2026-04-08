class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :movie_name , null: false
      t.string :movie_genre , null: false
      t.decimal :imdb_rating, precision: 2 ,scale: 1  , null: false 
      t.string :movie_category , null: false
      t.string :duration
      t.string :language , null: false

      t.timestamps
    end
  end
end
