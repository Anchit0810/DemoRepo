class AddCategoryAndPriceToSeats < ActiveRecord::Migration[8.1]
  def change
    add_column :seats, :category, :string
    add_column :seats, :price, :decimal
  end
end
