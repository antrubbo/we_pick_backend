class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users
    end

    private

    def user_params
    end
    
end
