 json.extract! booking
 json.id booking.id
 user = booking.user
 json.name user.user_name
 json.email user.user_email
 show = booking.show
 json.show_number show.id
 movie = show.movie
 theater = show.theater
 json.movie movie.movie_name 
 json.theater_name theater.theater_name
 json.location theater.theater_location
 seat = booking.seats
#json.seat_no seat.seat_number
json.seats booking.seats.pluck(:seat_number).join(',')
json.ticket_price booking.total_price
#     json.seat_no seat.seat_number
#  end
# json.extract! booking, :user_name  , :user_email , :movie_name , :theater_name , :theater_location , :show_time



