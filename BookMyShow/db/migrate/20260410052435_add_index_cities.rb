class AddIndexCities < ActiveRecord::Migration[8.1]
  def change
    add_index :cities, [:city_name, :state], unique: true
  end
end
