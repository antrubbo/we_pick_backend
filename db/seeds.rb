require 'faker'
require 'json'
require 'rest-client'
require 'byebug'
require 'themoviedb-api'

Movie.destroy_all
User.destroy_all
List.destroy_all
MovieChoice.destroy_all

Tmdb::Api.key("99fdd78beedc847a99f420187e092842")

#------------------------------------------------------------------------

puts "Creating Users"

5.times do
    User.create(username: Faker::Name.name, email: Faker::Internet.email)
end

# --------------------------------------------------------------------------- 

puts "Creating Popular Movies"

def make_popular_api_call
    popular_movies = Tmdb::Movie.popular
    config = Tmdb::Configuration.get
    create_popular_movies(popular_movies, config)
end

def create_popular_movies(popular_movies, config)
    popular_movies.results.each do |m|
        Movie.create(title: m.title, description: m.overview, release_date: m.release_date, genres: m.genre_ids, runtime: m.runtime, poster_path: "#{config.images.base_url + config.images.backdrop_sizes[0]}" + m.poster_path, search_id: m.id)
    end
end

make_popular_api_call

#---------------------------------------------------------------------------

puts "Creating Lists"

List.create(name: Faker::TvShows::MichaelScott.quote, user_id: User.first.id)
List.create(name: Faker::TvShows::MichaelScott.quote, user_id: User.second.id)
List.create(name: Faker::TvShows::MichaelScott.quote, user_id: User.third.id)
List.create(name: Faker::TvShows::MichaelScott.quote, user_id: User.fourth.id)
List.create(name: Faker::TvShows::MichaelScott.quote, user_id: User.fifth.id)

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

MovieChoice.create(list_id: List.third.id, movie_id: num.rand(1..4))
MovieChoice.create(list_id: List.third.id, movie_id: num.rand(5..8))
MovieChoice.create(list_id: List.third.id, movie_id: num.rand(9..12))
MovieChoice.create(list_id: List.third.id, movie_id: num.rand(13..16))
MovieChoice.create(list_id: List.third.id, movie_id: num.rand(17..20))

MovieChoice.create(list_id: List.fourth.id, movie_id: num.rand(1..4))
MovieChoice.create(list_id: List.fourth.id, movie_id: num.rand(5..8))
MovieChoice.create(list_id: List.fourth.id, movie_id: num.rand(9..12))
MovieChoice.create(list_id: List.fourth.id, movie_id: num.rand(13..16))
MovieChoice.create(list_id: List.fourth.id, movie_id: num.rand(17..20))

MovieChoice.create(list_id: List.fifth.id, movie_id: num.rand(1..4))
MovieChoice.create(list_id: List.fifth.id, movie_id: num.rand(5..8))
MovieChoice.create(list_id: List.fifth.id, movie_id: num.rand(9..12))
MovieChoice.create(list_id: List.fifth.id, movie_id: num.rand(13..16))
MovieChoice.create(list_id: List.fifth.id, movie_id: num.rand(17..20))
