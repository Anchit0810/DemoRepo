class CreateSeats < ActiveRecord::Migration[8.1]
  def change
    create_table :seats do |t|
      t.references :show, null: false, foreign_key: true
      t.string :seat_number 
      t.boolean :booked , default: false 

      t.timestamps
    end
    add_index :seats, [:show_id , :seat_number] 
  end
end
