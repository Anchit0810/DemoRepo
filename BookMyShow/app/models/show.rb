class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theater

  validates :show_time , presence: true , format: { with: /\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\z/, message: "must be in YYYY-MM-DD HH:MM:SS format" }



end
