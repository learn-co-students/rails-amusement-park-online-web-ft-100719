class SessionsController < ApplicationController

  def new

  end

  def create
    if params[:user]
      @user = User.find_by(name: params[:user][:name])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signing_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
      session.delete(:user_id)
      redirect_to root_path
  end




end
