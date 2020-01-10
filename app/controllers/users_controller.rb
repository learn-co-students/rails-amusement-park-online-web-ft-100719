class UsersController < ApplicationController

  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
   
    @user = User.new(user_params)

    if @user.save
      # If user saves in the db successfully:
      flash.now.notice = "Account created successfully!"
      session[:user_id] = @user.id
      #session[:name] = @user.name
      redirect_to user_path(@user)
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Couldn't create account."
      return redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  

  private 
  
  
def user_params
    params.require(:user).permit(:name, 
                                :password, 
                                :password_confirmation,
                                :nausea,
                                :happiness,
                                :tickets,
                                :height,
                                :admin)
  end
  
end
