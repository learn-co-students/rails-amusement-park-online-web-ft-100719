class SessionsController < ApplicationController
    def new
        redirect_to current_user if is_logged_in?
    end

    def create
        @user = User.find_by(name:params[:user][:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        end
    end

    def destroy
        if is_logged_in?
            session.clear
            redirect_to '/'
        end
    end
end
