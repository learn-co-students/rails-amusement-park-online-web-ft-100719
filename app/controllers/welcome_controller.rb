class WelcomeController < ApplicationController
    def home
        redirect_to current_user if is_logged_in?
    end
end
