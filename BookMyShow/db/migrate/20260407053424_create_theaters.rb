class CreateTheaters < ActiveRecord::Migration[8.1]
  
  def change
    create_table :theaters , id: :uuid do |t|
      
      t.references :city , null: false, foreign_key: true , index: {unique: true}
      t.string :theater_name , index: {unique: true}
      t.string :theater_location , index: {unique: true}

      t.timestamps
   
    end
    
    add_index :theaters, [:theater_name , :theater_location], unique: true
  
  end

end