class User < ApplicationRecord
    has_many :bank_accounts
    has_many :bank_account_transactions

    validates :name , presence: true , format: {with: /\A[a-zA-z\s]*\z/}
    
    validates :number , presence: true, uniqueness: true, numericality: {greater_than_or_equal_to: 10 }

    validates :email , presence: true , format: {with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true 

   validate :name_should_not_be_email
    
    
    private 
    
    def name_should_not_be_email
        errors.add(:name, 'should not be email') if name == email
    end

end