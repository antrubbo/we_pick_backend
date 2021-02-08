class MovieChoicesController < ApplicationController
    def index
        movie_choices = MovieChoice.all 
        render json: movie_choices
    end

    def create 
        movie_choice = MovieChoice.create!(movie_choice_params) 
        render json: movie_choice
    end 

    def destroy
        movie_choice = MovieChoice.find_by(id: params[:id])
        movie_choice.destroy
        render json: movie_choice
    end

    private 

    def movie_choice_params 
        params.permit(:list_id, :movie_id)
    end
end
