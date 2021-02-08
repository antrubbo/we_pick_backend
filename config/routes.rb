Rails.application.routes.draw do
  resources :movie_choices
  resources :movies
  resources :lists
  resources :users
  
  post '/login', to: 'users#login'
  post '/details', to: 'movies#details'
  post '/search', to: 'movies#search'
end
