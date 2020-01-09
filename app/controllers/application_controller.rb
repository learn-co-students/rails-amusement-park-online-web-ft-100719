class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :redirect_if_not_logged_in
  
  def redirect_if_not_logged_in
    #this method is invoked if user is not logged in and tries to view, edit or delete
    if !logged_in?
      flash[:error] = "Please login first"
      redirect_to root_path
    end
  end

  # def redirect_if_not_authorized
  #   #this method is invoked if user is logged in but tries to view, edit or delete a practice_log that does not exist or belong to them
  #   flash[:error] = "There is no such log associated with your account. You cannot View, Edit or Delete it"
  #   redirect to "/practice_logs"
      
  # end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
end
