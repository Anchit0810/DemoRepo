Rails.application.routes.draw do
  resources :booking_seats
  resources :bookings
  resources :users 

 
  # get "users/idex"
  # get "users/show"
  # get "users/create"
  # get "users/update"
  # get "users/destroy"
  # get "users/index"
  # get "test/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :movies 
  resources :theaters
  # put '/theaters/:city_id', to: 'theaters#update'
  resources :shows
  resources :cities
  # resources :users
  # get '/users/:id', to: 'users#show'
  # get '/users/:user_email', to: 'users#show'
  post '/login', to: 'users#login'
  resources :seats


  get "/seats/:seat_number", to: 'seats#find_seat_by_seat_number'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # get "/users/", to: "users#anchit"
  # get '/seats' to: ''
  # get '/bookings', to: 'bookings#index'
  # destroy '/bookings/:id', to: 'bookings#destroy'
  
  get '/booking_seats', to: 'booking_seats#index'

  # delete 'booking', to: 'booking#cancel_booking' 

  get "/movies", to: "movies#index"
  get "/movies/:id", to: "movies#show"
  post "/movies", to: "movies#create"
  patch "/movies/:id" , to: "movies#update"
  put "/movies/:id" , to: "movies#update"
  delete '/movies/:id', to: 'movies#destroy'


  # Defines the root path route ("/")
  # root "posts#index"
end
