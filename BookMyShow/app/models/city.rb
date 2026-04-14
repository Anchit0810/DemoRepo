class City < ApplicationRecord
    has_many :theaters

    before_validation :downcase_city_name_and_location
    
    validates :city_name , presence: true ,format: { with: /\A[a-zA-Z\s]+\z/ , message: "only letters and spaces allowed"}

    validates :state , presence: true ,format: { with: /\A[a-zA-Z\s]+\z/ , message: "only letters and spaces allowed"}

    private  
    def downcase_city_name_and_location
        self.city_name = city_name.downcase.strip
        self.state = state.downcase.strip
    end 
    
end
