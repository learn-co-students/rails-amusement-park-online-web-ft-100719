class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def logged_in?
    redirect_to '/' unless !session[:user_id].nil?
  end

  def current_user
    User.find(session[:user_id])
  end

  def is_admin?
    current_user.admin
  end
end
