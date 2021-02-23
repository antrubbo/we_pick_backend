class UsersController < ApplicationController
    def index
        users = User.all 
        render json: users
    end

    def show
        user = AuthorizeRequest.new(request.headers).user
        if user
            render json: user
        else
            render json: {error: "Unauthorized Request"}, status: :unauthorized
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

    def user_search 
        # user = User.find_by("username LIKE ?", params[:username])
        user = User.all.select { |user| user.username.downcase == params[:username]}
        if user == []
            render json: {errors: "Username does not match our records"}
        else  
            render json: user
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        render json: user
    end


    # get/profile
    # def profile
    #     begin 
    #         #  read the token from the authorization header
    #         auth_headers = request.headers["Authorization"]
    #         token = auth_headers.split.last
    #         #  decode the token
    #         payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
    #         #  get the user ID from the payload
    #         user_id = payload[0]["user_id"]
    #         #  find the user
    #         user = User.find(user_id)
    #         render json: user
    #     rescue 
    #         render json: {error: "nice try, pal."}, status: :unauthorized
    #     end
    # end

    def profile   
        user = AuthorizeRequest.new(request.headers).user
        if user
            render json: user
        else
            render json: {error: "Unauthorized Request"}, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end
    
end
