Rails.application.routes.draw do
  resources :movie_choices
  resources :movies
  resources :lists
  resources :users
  
  post '/register', to: 'auth#register'
  post '/login', to: 'auth#login' 
  get '/profile', to: 'users#profile'

  post '/details', to: 'movies#details'
  post '/search', to: 'movies#search'
  get '/lists/:id/movies', to: 'lists#movies'
  post 'user_search', to: 'users#user_search'
  get '/genre_list', to: 'movies#genre_list'
  post '/recommendation', to: 'movies#recommendation'
end
