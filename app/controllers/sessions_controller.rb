class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(user_name: params[:user][:user_name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def create_with_google
        
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end