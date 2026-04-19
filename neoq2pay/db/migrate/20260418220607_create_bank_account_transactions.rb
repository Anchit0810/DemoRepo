class CreateBankAccountTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :bank_account_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bank_account, null: false, foreign_key: true
      t.string :operation , null: false 
      t.decimal :amount , null: false , precision: 10 , scale: 2 , default: 0.0
      t.string :remarks

      t.timestamps
    end
  end
end
