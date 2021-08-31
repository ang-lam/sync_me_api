Rails.application.routes.draw do
  resources :messages
  # resources :connections
  # resources :users
  resources :users, only: [:create, :index, :show] #handle signup, query users
  resources :connections, only: [:index, :create]
  resources :posts, only: [:index, :create, :destroy]
  post '/login', to: "auth#login" #handles login for exisiting users
  get '/auto_login', to: "auth#auto_login" #handles auto login when user revisits
  delete '/delete_connection', to: "connections#delete"
end
