class MoviesController < ApplicationController

    def index
        movies = Movie.all 
        render json: movies
    end

    def show
        movie = Movie.find_by(id: params[:id])
        render json: movie
    end 

    def popular
        
    end

    private

    # def movie_params
    #     params.permit(:title, :description, :release_date, :genres, :runtime, :video_key, :poster_path, :search_id, :homepage)
    # end
end
