class UsersController < ApplicationController

    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user.nil? || user != current_user
            redirect_to user_path(current_user), alert: "That's not your profile"
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password, :password_confirmation)
    end
end
