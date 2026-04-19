class BankAccountTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :bank_account

  validates :user_id , :bank_account_id , :operation , :amount , presence: true 

  validates :operation , inclusion: { in: %w(credit debit) } 

  validates :amount , numericality: {in: 0.01..99999999.99}

end
