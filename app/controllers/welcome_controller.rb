class WelcomeController < ApplicationController
    skip_before_action :redirect_if_not_logged_in
    
    def home
        #this will render the home page
    end

end
  