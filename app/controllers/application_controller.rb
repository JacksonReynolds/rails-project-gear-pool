class ApplicationController < ActionController::Base
    helper_method :current_user, :require_login

    def welcome; end

    def current_user
        User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_login
        redirect_to signin_path if !current_user
    end
end
