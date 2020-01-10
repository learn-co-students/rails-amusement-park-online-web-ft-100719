class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
 
  def new
  end

  def create
    if params[:user][:name].nil? || params[:user][:name].empty? || params[:password].empty?
      #binding.pry
      flash[:error] = "Username cannot be empty"
      redirect_to login_path
    else
      #binding.pry
      user = User.find_by(name: params[:user][:name])
      authenticated = user.try(:authenticate, params[:password])
      return redirect_to login_path unless authenticated
      session[:user_id] = user.id
      #session[:name] = params[:user][:name] 
      redirect_to user_path(user)
    end
  end

  def destroy
    #session.delete(:name)
    session.delete(:user_id)
    binding.pry
    redirect_to root_path
  end
end
