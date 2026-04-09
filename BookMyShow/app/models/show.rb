class Show < ApplicationRecord
 belongs_to :movie
 belongs_to :theater

 validates :show_time, presence: true
 validate :show_time_format

 private

  def show_time_format
    return if show_time_before_type_cast.blank?
    unless show_time_before_type_cast.match?(/\A\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]) (0\d|1\d|2[0-3]):[0-5]\d:[0-5]\d\z/)
      errors.add(:show_time,"must be in YYYY-MM-DD HH:MM:SS format")
    end
  end
end

