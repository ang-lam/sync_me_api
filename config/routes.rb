Rails.application.routes.draw do

  resources :users, only: [:create, :index]
  resources :connections, only: [:index, :create]
  resources :messages, only: [:index, :create]
  resources :posts, only: [:index, :create]
  post '/login', to: "auth#login" #handles login for exisiting users
  get '/auto_login', to: "auth#auto_login" #handles auto login when user revisits
  delete '/delete_connection', to: "connections#delete"
end
