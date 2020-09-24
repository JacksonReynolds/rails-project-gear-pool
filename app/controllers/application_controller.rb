class ApplicationController < ActionController::Base

    def welcome; end

    module helpers do 

        def current_user
            User.find_by(id: session[:user_id]) if session[:user_id]
        end

        def require_login
            redirect_to signin_path if !current_user
        end

    end
end
