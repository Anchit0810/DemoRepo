class CreateCities < ActiveRecord::Migration[8.1]
  
  def change
    create_table :cities do |t|
      t.string :city_name, index: {unique: true}
      t.string :state , index: {unique: true}

      t.timestamps
    end
  
  end
end
