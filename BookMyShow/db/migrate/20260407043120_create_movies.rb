class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :movie_name , null: false , index: {unique: true}
      t.string :movie_genre , null: false , index: {unique: true}
      t.decimal :imdb_rating, precision: 2 ,scale: 1  , null: false , index: {unique: true}
      t.string :movie_category , null: false , index: {unique: true}
      t.string :duration , index: {unique: true}
      t.string :language , null: false , index: {unique: true}

      t.timestamps
    end
  end
end
