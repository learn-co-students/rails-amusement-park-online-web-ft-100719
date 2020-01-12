class UsersController < ApplicationController

  def new
  end

  def show
    if !logged_in?
      redirect_to root_path
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end



private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end





end
