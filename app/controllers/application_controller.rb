class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  
  def logged_in?
    !!current_user
  end

  def redirect_if_logged_out
    if !logged_in?
      redirect_to root_path
    end
  end

  def current_user
    session[:user_id]
  end
end
