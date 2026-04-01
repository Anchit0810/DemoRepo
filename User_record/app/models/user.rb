class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/

  validates :first_name , presence: true , length: {maximum: 20}, format: {with: /\A[a-zA-Z]+\z/}
  
  validates :last_name , presence: true , length: {maximum: 20}, format: {with: /\A[a-zA-Z]+\z/}
  
  validates :email , presence: true , uniqueness: true , format: { with: VALID_EMAIL_REGEX }

  validates :country_code , presence: true , length: {is: 3} , format: {with: /\A[^\0-9\+]+\z/ }
  
  validates :mobile_number , presence: true ,length: {is: 10} , format: {with: /\A[2-9]{1}[0-9]{9}\z/ }
  
  validates :country , presence: true , format: {with: /\A[a-zA-Z]+\z/}
  
  validates :state , presence: true , format: {with: /\A[a-zA-Z]+\z/}
  
  validates :city , presence: true , format: {with: /\A[a-zA-Z]+\z/}

end
