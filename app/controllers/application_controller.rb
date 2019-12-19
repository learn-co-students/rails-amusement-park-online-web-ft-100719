class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    if !current_user
      redirect_to '/'
    end
  end

  def current_user
    session[:user_id]
  end
end
