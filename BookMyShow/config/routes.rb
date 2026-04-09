Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :movies 
  resources :theaters
  resources :shows
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  get "/movies", to: "movies#index"
  get "/movies/:id", to: "movies#show"
  post "/movies", to: "movies#create"
  patch "/movies/:id" , to: "movies#update"
  put "/movies/:id" , to: "movies#update"



  # Defines the root path route ("/")
  # root "posts#index"
end
