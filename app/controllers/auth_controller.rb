class AuthController < ApplicationController

  # post/register
  def register
    # create a new user
    user = User.create(register_params)
    if user.valid?
      secret = ENV["SECRET_KEY_BASE"]
      # also send back a token that they can use to re-authenticate themselves
      token = JWT.encode({user_id: user.id}, secret, "HS256")
      render json: {user: UserSerializer.new(user), token: token}, status: :created
    else  
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # post/login
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      secret = ENV["SECRET_KEY_BASE"]
      # also send back a token that they can use to re-authenticate themselves
      token = JWT.encode({user_id: user.id}, secret, "HS256")
      # UserSerializer.new prevents the password from being sent back in the response
      render json: {user: UserSerializer.new(user), token: token} 
    else 
      render json: {error: "Invalid Email Address or Password"}, status: :unauthorized 
    end
  end

  private

  def register_params
    params.permit(:username, :email, :password)
  end

end
