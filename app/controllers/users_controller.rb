class UsersController < ApplicationController
    def index
        users = User.all 
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def create 
        user = User.create(user_params)
        if user.valid?
            render json: user
        else 
            render json: {errors: user.errors.full_messages},
            status: :not_acceptable
        end
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)

        if user.valid?
            render json: user
        else 
            render json: {errors: user.errors.full_messages}
        end 
    end 

    def login
        user = User.find_by(email: params[:email])
        if user
            render json: user 
        else  
            render json: {errors: "Email or password does not match our records"},
            status: :unauthorized
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        render json: user
    end

    private

    def user_params
        params.permit(:username, :email)
    end
    
end
