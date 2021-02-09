class ListsController < ApplicationController

    def index
        lists = List.all
        render json: lists
    end

    def show 
        list = List.find_by(id: params[:id])
        render json: list
    end

    def movies 
        list = List.find_by(id: params[:id])
        render json: list.movies
        # custom_movies = []
  
        # list.movies.map do |movie| 
        #     custom_movie = {}
        #     custom_movie[:id] = movie.id
        #     custom_movie[:title] = movie.title
        #     # custom_movie[:description] = movie.description
        #     # custom_movie[:search_id] = movie.search_id
        #     custom_movies.push(custom_movie)
        # end 
        # return custom_movies
    end

end
