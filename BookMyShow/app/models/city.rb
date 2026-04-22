class City < ApplicationRecord
    has_many :theaters

    before_validation :downcase_city_name_and_location
    
    # before_create :downcase_city_name_and_location
    
    validates :city_name , presence: true ,format: { with: /\A[a-zA-Z\s]+\z/ , message: "only letters and spaces allowed"}

    validates :state , presence: true ,format: { with: /\A[a-zA-Z\s]+\z/ , message: "only letters and spaces allowed"}

    private  
    
    def downcase_city_name_and_location
        self.city_name = city_name.downcase.strip
        self.state = state.downcase.strip
    end 
    
    def valid_city_state
        unless City.exists?(city_name: @city.city_name, state: @city.state)
            errors.add("Already exists! ")
        end
    end

end
