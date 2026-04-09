class Theater < ApplicationRecord

    has_many :shows
    has_many :movies, through: :shows
    
    before_validation :downcase_theater_name_location
    

    validates :theater_name , presence: true, format: { with: /\A[a-zA-Z\s]+\z/ , message: "only letters and spaces allowed"}
    validates :theater_location , presence: true, format: { with: /\A[a-zA-Z\s]+\z/ , message: "only letters and spaces allowed"}
    private 
    def downcase_theater_name_location
        self.theater_name = theater_name.downcase.strip
        self.theater_location = theater_location.downcase.strip
    end 
end
