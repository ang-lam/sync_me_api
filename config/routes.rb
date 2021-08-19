Rails.application.routes.draw do
  # resources :connections
  # resources :users
  resources :users, only: [:create, :index, :show] #handle signup, query users
  resources :connections, only: [:index, :create]
  post '/login', to: "auth#login" #handles login for exisiting users
  get '/auto_login', to: "auth#auto_login" #handles auto login when user revisits
end
