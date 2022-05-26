Rails.application.routes.draw do
  resources :user_expenses, only: [:index, :create, :update, :destroy]
  resources :users, only: [:index, :update, :destroy]

  #check out for frontend fetches https://learning.flatironschool.com/courses/4231/pages/authenticating-users?module_item_id=311665

  #for login 
  post "/login", to: "sessions#create"
  #create new user
  post "/signup", to: "users#create"
  #allows user to stay logged in 
  get "/me", to: "users#show"
  #to log the user out 
  delete "/logout", to: "sessions#destroy"

  #for balance update
  put "/balance", to: "users#update_balance"

  #for remainder update
  put "/remainder", to: "users#update_remainder"
  
  resources :transactors
  resources :transactees
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
