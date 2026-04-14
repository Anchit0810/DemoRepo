class CreateSeats < ActiveRecord::Migration[8.1]
  def change
    create_table :seats do |t|
      t.references :show, null: false, foreign_key: true
      t.string :seat_number , index: {unique: true}
      t.boolean :booked , default: false , index: {unique: true}

      t.timestamps
    end
  end
end
