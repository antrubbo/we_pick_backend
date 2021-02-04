class ApplicationController < ActionController::API
    before_action :authenticate

    def authenticate
        @current_user = User.last
    end

end
