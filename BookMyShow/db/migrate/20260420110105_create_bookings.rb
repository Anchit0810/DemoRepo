class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
      t.decimal :total_price , precision: 8 , scale: 2 , default: 0.0

      t.timestamps
    end
  end
end
