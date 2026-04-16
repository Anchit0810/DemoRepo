class User < ApplicationRecord

    enum :role , { admin_user: 0 , normal_user: 1 }  

    VALID_ACTIVE_ENTRY = [ true , false ]

    validates :user_name , presence: true , format: { with: /\A[a-zA-Z\s]+\z/  , message: 'only letters and spaces allowed allowed' } 

    validates :user_number , presence: true , format: {with: /\A[3-9]{1}[0-9]{9}\z/ , message: 'only digits allowed' }
    
    validates :user_email , presence: true , format: { with: URI::MailTo::EMAIL_REGEXP , message: 'enter only valid email' }
    
    validates :active , presence: true , inclusion: { in: VALID_ACTIVE_ENTRY , message: 'invalid entry' }

end
