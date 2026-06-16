class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :user_name 
      t.string :user_email , index: {unique: true}
      t.integer :role  
      t.string :user_number , index: {unique: true}
      t.boolean :active 
      t.timestamps
    end
  end
end
