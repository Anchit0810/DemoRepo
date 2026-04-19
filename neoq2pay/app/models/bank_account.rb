class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :bank_account_transactions
  
  validates :account_number , presence: true , uniqueness: {scope: :ifsc_code}

  validates :ifsc_code, presence: true 

  validates :bank_name , presence: true 

  validates :balance , numericality: {in: 0.01..99999999.99}
   
  def add_money(amount , remarks)
    bank_account_transactions.create(user_id: user_id,
                                    bank_account_id: id , 
                                    operation: 'credit',
                                    amount: amount,
                                    remarks: remarks)
  end
  
  def withdraw_money(amount , remarks)
    bank_account_transactions.create(user_id: user_id,
                                    bank_account_id: id,
                                    operation: 'debit',
                                    amount: amount,
                                    remarks: remarks)
  end

end
