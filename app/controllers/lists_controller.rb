class ListsController < ApplicationController

    def index
        lists = List.all
        render json: lists
    end

    def show 
        list = List.find_by(id: params[:id])
        render json: list
    end


end
