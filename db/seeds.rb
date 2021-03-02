require 'json'
require 'rest-client'
# require 'byebug'
require 'themoviedb-api'

Movie.destroy_all
User.destroy_all
List.destroy_all
MovieChoice.destroy_all

Tmdb::Api.key("99fdd78beedc847a99f420187e092842")

#------------------------------------------------------------------------

puts "Creating Users"

User.create(username: "ant_rubbo", email: "anthony@gmail.com", password: "123")
User.create(username: "alison_cusano", email: "alison@gmail.com", password: "abc")

# --------------------------------------------------------------------------- 

puts "Creating Popular Movies"

def make_popular_api_call
    popular_movies = Tmdb::Movie.popular
    config = Tmdb::Configuration.get
    create_popular_movies(popular_movies, config)
end

def create_popular_movies(popular_movies, config)
    popular_movies.results.each do |m|
        Movie.create(title: m.title, description: m.overview, release_date: m.release_date, genres: m.genre_ids, runtime: m.runtime, poster_path: m.poster_path, search_id: m.id)
    end
end

make_popular_api_call

#---------------------------------------------------------------------------------

puts "Creating Movie Choices"

num = Random.new

MovieChoice.create(list_id: List.first.id, movie_id: num.rand(1..4))
MovieChoice.create(list_id: List.first.id, movie_id: num.rand(5..8))
MovieChoice.create(list_id: List.first.id, movie_id: num.rand(9..12))
MovieChoice.create(list_id: List.first.id, movie_id: num.rand(13..16))
MovieChoice.create(list_id: List.first.id, movie_id: num.rand(17..20))

MovieChoice.create(list_id: List.second.id, movie_id: num.rand(1..4))
MovieChoice.create(list_id: List.second.id, movie_id: num.rand(5..8))
MovieChoice.create(list_id: List.second.id, movie_id: num.rand(9..12))
MovieChoice.create(list_id: List.second.id, movie_id: num.rand(13..16))
MovieChoice.create(list_id: List.second.id, movie_id: num.rand(17..20))