class CreateShows < ActiveRecord::Migration[8.1]
  def change

    create_table :shows do |t|
      t.references :movie, null: false, foreign_key: true 
      t.references :theater, null: false, foreign_key: true , type: :uuid
      t.datetime :show_time , index: {unique: true}

      t.timestamps
    end
  
  end

end
