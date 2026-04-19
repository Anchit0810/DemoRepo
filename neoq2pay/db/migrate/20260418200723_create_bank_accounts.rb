class CreateBankAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :account_number , null: false 
      t.string :ifsc_code , null: false 
      t.string :bank_name , null: false 
      t.decimal :balance , null: false , scale: 2 , precision: 10 , default: 

      t.timestamps
    end
  end
end
