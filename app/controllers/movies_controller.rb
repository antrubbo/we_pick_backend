require 'themoviedb-api'
require 'json'
require 'rest-client'
Tmdb::Api.key("99fdd78beedc847a99f420187e092842")

class MoviesController < ApplicationController

    def index
        movies = Movie.all 
        render json: movies
    end

    def show
        movie = Movie.find_by(id: params[:id])
        render json: movie
    end

    def create 
        movie = Movie.find_by(search_id: params[:search_id])
        if movie
            render json: movie
        else
            new_movie = Movie.create(movie_params)
            render json: new_movie
        end
    end

    def details
        movie = Movie.find_by(id: params[:id])
        movie_deets = RestClient.get("https://api.themoviedb.org/3/movie/#{movie.search_id}?api_key=99fdd78beedc847a99f420187e092842&language=en-US&append_to_response=videos,recommendations")
        render json: movie_deets
    end

    def search 
        search_movie = Tmdb::Search.movie(params[:title])
        render json: search_movie
    end

    def genre_list 
        genres = Tmdb::Genre.movie_list
        render json: genres
    end

    def recommendation 
        discover = Tmdb::Discover.movie({with_genres: params[:genre_id]})
        render json: discover
    end

    private

    def movie_params
        params.permit(:title, :description, :release_date, :genres, :runtime, :poster_path, :search_id)
    end
end
