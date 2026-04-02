class User < ApplicationRecord
	before_save :downcase_email

  before_validation :remove_email_spaces
  
  before_create :generate_user_code
  require 'securerandom'
 
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/


  validates :first_name , presence: true , length: {maximum: 20}, format: {with: /\A[a-zA-Z]+\z/},on: :create , on: :update # if: :will_save_change_to_first_name?
  
  validates :last_name , presence: true , length: {maximum: 20}, format: {with: /\A[a-zA-Z]+\z/}, on: :create, on: :update
  
  validates :email , presence: true , uniqueness: { case_sensitive: false } , format: { with: VALID_EMAIL_REGEX}, on: :create #, on: :update

  validates :country_code , presence: true , length: {is: 3} , format: {with: /\A\+\d{1,3}\z/ }, on: :create #,on: :update
  
  validates :mobile_number , presence: true ,length: {is: 10} , format: {with: /\A[2-9]{1}[0-9]{9}\z/ }, on: :create #, on: :update
  
  validates :country , presence: true , format: {with: /\A[a-zA-Z]+\z/},on: :create ,on: :update
  
  validates :state , presence: true , format: {with: /\A[a-zA-Z]+\z/},on: :create , on: :update
  
  validates :city , presence: true , format: {with: /\A[a-zA-Z]+\z/},on: :create ,on: :update


  private
  def downcase_email
	  self.email = email.downcase.strip
  end

  def remove_email_spaces
    self.email = email.strip
  end

  def generate_user_code
    self.user_code = "USR#{SecureRandom.random_number(1000..9999)}"
  end
end
