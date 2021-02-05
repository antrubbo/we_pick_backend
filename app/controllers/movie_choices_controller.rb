class MovieChoicesController < ApplicationController
    def index
        choices = MovieChoice.all 
        render json: choices
    end

    def create 
        choice = MovieChoice.create(movie_choice_params) 
        render json: choice
    end 

    private 

    def movie_choice_params 
        params.permit(:list_id, :movie_id)
    end
end
