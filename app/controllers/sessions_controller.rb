class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(user_name: params[:user][:user_name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end