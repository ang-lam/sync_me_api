Rails.application.routes.draw do
  # resources :connections
  # resources :users
  resources :users, only: [:create, :index] #handle signup, query users
  post '/login', to: "auth#login" #handles login for exisiting users
  get '/auto_login', to: "auth#auto_login" #handles auto login when user revisits
end
