class UsersController < ApplicationController

  def new 
    @user = User.new 
  end 

  def signin
    
  end 

  def signin_post
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user 
    else 
      redirect_to root_path
    end 
  end 

  def create 
    @user = User.new(user_params)

    if @user.save 
      session[:user_id] = @user.id
      redirect_to @user 
    else 
      redirect_to root_path
    end 
  end 
  
  def show
    if session[:user_id].nil? 
      redirect_to root_path
    else 
      @user = User.find_by(id: params[:id])
    end 
  end 

  def destroy
    session.delete :user_id 
    redirect_to root_path
  end 

  private 

  def user_params 
    params.require(:user).permit(:name,:happiness,:nausea,:height,:tickets,:password, :admin)
  end 
  
end
