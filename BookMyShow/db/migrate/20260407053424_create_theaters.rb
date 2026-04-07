class CreateTheaters < ActiveRecord::Migration[8.1]
  def change
    create_table :theaters do |t|
      t.string :theater_name
      t.string :theater_location

      t.timestamps
    end
  end
end
presence: true