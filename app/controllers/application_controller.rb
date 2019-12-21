class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :is_logged_in?
  helper_method :current_user, :admin?

  def is_logged_in?
    !!session[:user_id]
  end

  def require_login
    unless is_logged_in?
      flash[:message] = "Login Required."
      redirect_to '/' 
    end
  end

  def current_user
    User.find_by(id:session[:user_id])
  end

  def admin?
    current_user.admin
  end

  def require_admin?
    redirect_to current_user unless admin?
  end
end
