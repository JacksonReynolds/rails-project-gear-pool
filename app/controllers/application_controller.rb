class ApplicationController < ActionController::Base
    helper_method :current_user, :require_login, :require_logged_out

    def welcome; end

    def require_logged_out
        if current_user
            redirect_to root_path, alert: "You're already signed in"
        end
    end

    def current_user
        User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_login
        if !current_user
            redirect_to signin_path, alert: "Please sign in"
        end
    end
end
