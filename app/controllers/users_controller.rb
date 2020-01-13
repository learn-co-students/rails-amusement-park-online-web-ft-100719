class UsersController < ApplicationController 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = User.last.id 
            redirect_to user_path(current_user)
        else 
            redirect_to new_user_path
        end 
    end 

    def show 
        @user = User.find(params[:id])
        current_user
        redirect_to '/' if !logged_in?
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
    end 

end 