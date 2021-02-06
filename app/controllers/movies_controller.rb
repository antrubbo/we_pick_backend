class MoviesController < ApplicationController
    Tmdb::Api.key("99fdd78beedc847a99f420187e092842")

    def index
        movies = Movie.all 
        render json: movies
    end

    def show
        movie = Movie.find_by(id: params[:id])
        render json: movie
    end 

    def details
        movie = Movie.find_by(id: params[:id])
        # movie_resp = Tmdb::Movie.detail(movie.search_id)
        render json: movie
    end

    private

    def movie_params
        params.permit(:title, :description, :release_date, :genres, :runtime, :poster_path, :search_id)
    end
end
