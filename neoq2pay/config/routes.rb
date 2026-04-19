Rails.application.routes.draw do
  resources :bank_accounts
  post 'bank_accounts/:id/add_money', to: 'bank_accounts#add_money'
  post 'bank_accounts/:id/withdraw_money', to: 'bank_accounts#withdraw_money'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'users/', to: 'users#index' 
  get 'users/:id', to: 'users#show' 
  post 'users/', to: 'users#create'
  put 'users/:id', to: 'user#update' 
  patch 'users/:id' , to: 'user#update'
  delete 'users/:id', to: 'user#destroy' 
  
  #resources :users 
  # Defines the root path route ("/")
  # root "posts#index"
end
