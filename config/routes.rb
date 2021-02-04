Rails.application.routes.draw do
  resources :movie_choices
  resources :movies
  resources :lists
  resources :users
  
  post '/login', to: 'users#login'
  delete "/user/:id", to: "users#destroy"
end
