class SessionsController < ApplicationController
    def new
   end
  
    def create
      user = User.find(params[:user][:name])
      if user&.authenticate(params[:password])
        log_in(user)
  
        redirect_to user_path(user)
      else
        flash[:warning] = 'Invalid name/password combination'
        redirect_to root_path
      end
    end
  
    def destroy
      session.delete(:user_id)
      redirect_to root_path
    end
end 