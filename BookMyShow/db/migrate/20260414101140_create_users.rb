class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :user_name , index: {unique: true}
      t.string :user_email , index: {unique: true}
      t.integer :role , index: {unique: true} 
      t.integer :user_number , index: {unique: true}
      t.boolean :active , index: {unique: true}

      t.timestamps
    end
  end
end
