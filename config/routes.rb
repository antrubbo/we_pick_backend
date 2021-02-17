Rails.application.routes.draw do
  resources :movie_choices
  resources :movies
  resources :lists
  resources :users
  
  post '/login', to: 'users#login'
  post '/details', to: 'movies#details'
  post '/search', to: 'movies#search'
  get '/get_id', to: 'movies#get_id'
  get '/lists/:id/movies', to: 'lists#movies'
  post 'user_search', to: 'users#user_search'
  get '/genre_list', to: 'movies#genre_list'
  post '/recommendation', to: 'movies#recommendation'
end
