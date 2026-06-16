Rails.application.routes.draw do
  resources :practices
  resources :tests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :abcd
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  post "/users", to: "users#create"
  patch "/users/:id", to: "users#update"
  put "/users/:id", to: "users#update"

  # Defines the root path route ("/")
  # root "posts#index"
end
